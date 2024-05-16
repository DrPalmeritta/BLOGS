${{\color{orange}\Huge{\textsf{ Topics data: }}}}\$

<details>
	<summary>
	Create <strong>template</strong> for index
	</summary>
	<br />

On the first state you should insert name pattern such as:

**`nsi_test*`**

First template settings page have to enable:

`Create data stream`

Index settings:

```json
{
	"index": {
		"lifecycle": {
			"name": "nsi_test_lifecycle"
			},
		"number_of_replicas": "0"
	}
}
```

Alias settings:

```json
{
	"nsi_test": {
		"is_write_index": true
	}
}
```

> If the data flow from the agents to the index was started before the template was created, the index must be deleted to apply the settings. It will be created again with new settings.

</details>

${{\color{orange}\Huge{\textsf{ Typical errors: }}}}\$

`To be continued...`
