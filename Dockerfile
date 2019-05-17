FROM openjdk:8-jdk-stretch as untar

#ARG DRUID_VERSION=0.14.0-incubating
ARG DRUID_VERSION=0.15.0-incubating-SNAPSHOT

COPY apache-druid-$DRUID_VERSION-bin.tar.gz /tmp
RUN tar -xzf /tmp/apache-druid-$DRUID_VERSION-bin.tar.gz -C /opt 

# use openjdk until we can switch to jdk11 with cc-docker-base
FROM openjdk:8-jdk-stretch

#ARG DRUID_VERSION=0.14.0-incubating
ARG DRUID_VERSION=0.15.0-incubating-SNAPSHOT

# Druid env variable
ENV DRUID_HOSTNAME     '-'
ENV DRUID_LOGLEVEL     '-'
ENV DRUID_USE_CONTAINER_IP '-'
ENV DRUID_SEGMENTCACHE_LOCATION  '-'
ENV DRUID_DEEPSTORAGE_LOCAL_DIR  '-'

# RUN export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -qq update \
#     && apt-get -qq -y install curl && \
#     curl \
#     http://mirrors.ocf.berkeley.edu/apache/incubator/druid/$DRUID_VERSION/apache-druid-$DRUID_VERSION-bin.tar.gz | tar -xzf - -C /opt \
#     && ln -s /opt/apache-druid-$DRUID_VERSION /opt/druid

COPY --from=untar /opt/apache-druid-$DRUID_VERSION /opt/apache-druid-$DRUID_VERSION/
RUN ln -s apache-druid-$DRUID_VERSION /opt/druid

COPY conf /opt/druid/conf
COPY start-druid.sh /start-druid.sh

ENTRYPOINT ["/start-druid.sh"]
