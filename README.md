Docker Druid
================

Tags:

- 0.9.1.1, 0.9, latest ([Dockerfile](https://github.com/cimatech/druid-container/blob/master/Dockerfile))

What is Druid?
==================

Druid is an open-source analytics data store designed for business intelligence (OLAP) queries on event data. Druid provides low latency (real-time) data ingestion, flexible data exploration, and fast data aggregation. Existing Druid deployments have scaled to trillions of events and petabytes of data. Druid is most commonly used to power user-facing analytic applications.


Configuration
=============

Available environment options:

- `DRUID_XMX` '-'
- `DRUID_XMS` '-'
- `DRUID_NEWSIZE` '-'
- `DRUID_MAXNEWSIZE` '-'
- `DRUID_HOSTNAME` '-'
- `DRUID_SEGMENTCACHE_LOCATION` '-'

Authors
=======
- Said Apale <saidimu@gmail.com>

Special thanks goes to:  
- Kristian Martensen <kma@cima.dk>  
- Jean-Baptiste DALIDO <jb@zen.ly>
- Clément REY <clement@zen.ly>
