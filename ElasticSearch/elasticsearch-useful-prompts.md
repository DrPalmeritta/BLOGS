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

`GET _cat/indices` - list all indices in runtime

`GET [index_name]/_stats?pretty` - statistics of a particular indice

`GET _cat/indices/[index_name]?v&pretty` - also output of a specific indice

`GET _cat/shards` - output of all shards (supposedly a minimal entity)

`GET [index_name]/_mapping?pretty` - check mapping for a specific indice

`DELETE localhost:9200/[index_name]` - delete a specific indice

### snapshots:

`GET _snapshot?pretty` - show list of all snapshot dir with some pretty view

`GET _snapshot/snapshots/_all?pretty` - display all known dir snapshots

`GET _snapshot/snapshots/[snapshot_name]?pretty` - output the contents of a specific snapshot

`GET _snapshot/snapshots/*?pretty&verbose=false` - same way to output snapshots, but not verbose mod

### aliases:

`GET _cat/aliases` - this output is much more convenient

`GET _alias` - standard json output of an entity

`DELETE [indice_name]/_alias/[alias_name]` - deleting the bound alias for indice
