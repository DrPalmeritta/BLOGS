${{\color{Goldenrod}\Huge{\textsf{ Topics data: }}}}\$

<details>
	<summary>
	If the ${{\color{Goldenrod}\Huge{\textsf{ snapshot }}}}\$ directory is broken, there is a recovery process
	</summary>
	<br />
`curl -XPOST localhost:9200/_snapshot/snapshots/disable` - try to disable if the snapshot entity is available

`curl -XDELETE localhost:9200/_snapshot/snapshots` - delete the snapshot entity

```bash
curl -XPUT localhost:9200/_snapshot/snapshots" \
-H 'Content-Type: application/json' \
-d '{"type": "fs","settings": {"location": "/usr/share/opensearch/data/snapshots"}}'
```

Re-create the snapshot, but we need to check that the elasticsearch config has a pointer to this directory:

`/usr/share/opensearch/config/opensearch.yaml` 


💡 The addition process is described in [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html)

`curl -XGET localhost:9200/_snapshot/snapshots/_all?pretty` - check that the new entity matches

After that you can create snapshots inside again, like this:

```bash
curl -XPUT localhost:9200/_snapshot/snapshots/snapshot_daily_001 \
-H 'Content-Type: application/json' \
-d '{ "indices": "index_name-*", "ignore_unavailable": true, "include_global_state": false, "metadata": {"taken_at": "2077-01-01T00:00:00Z" }}'
```

</details>

<details>
	<summary>
	Test filling of Elasticserch base with junk data
	</summary>
	<br />

```bash
curl -o us_states.ndjson https://raw.githubusercontent.com/Ego1/SampleData/main/elasticsearch/bulk_upload/us_states.ndjson 
```

```bash
curl -H "Content-Type: application/x-ndjson" \
-XPOST localhost:9200/_bulk \
--data-binary "@us_states.ndjson"
```

`curl localhost:9200/_cat/indices` - view the index being created

</details>
