## Useful prompts:

### health-check:

`GET _cat/allocation?v&pretty` - for problems with shards allocation + cluster helthcheck

`GET _cat/health` - lists status for all cluster nodes

`GET _cat/cluster_manger?v` - lists information that helps identify the elected cluster manager node

### cluster:

`GET _cluster/health?v` - life status for all cluster nodes

`GET _cluster/allocation/explain?pretty` - check cluster shards + cluster verification

`GET _aliases?pretty` - list of indice references

`GET _cat/indices?v&health=red` - output list of indices with red status

`GET _nodes/status?pretty` - status of cluster nodes

`GET _dangling?pretty` - view possible unhealthy indices with cluster indication

### indices:

`GET _cat/indices` - show list of all indexes that are in runtime
