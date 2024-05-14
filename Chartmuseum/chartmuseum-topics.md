${{\color{orange}\Huge{\textsf{ Topics data: }}}}\$

<details>
	<summary>
	Uploading a chart package
	</summary>
	<br />

First create `mychart-0.1.0.tgz` using the [Helm CLI](https://docs.helm.sh/using_helm/#installing-helm):

```bash
cd mychart/
helm package .
```

Upload `mychart-0.1.0.tgz`:

```bash
curl --data-binary "@mychart-0.1.0.tgz" http://localhost:8080/api/charts
```

If you've signed your package and generated a [provenance file](https://github.com/helm/helm-www/blob/master/content/en/docs/topics/provenance.md), upload it with:

```bash
curl --data-binary "@mychart-0.1.0.tgz.prov" http://localhost:8080/api/prov
```

Both files can also be uploaded at once (or one at a time) on the `/api/charts` route using the `multipart/form-data` format:

```bash
curl -F "chart=@mychart-0.1.0.tgz" -F "prov=@mychart-0.1.0.tgz.prov" http://localhost:8080/api/charts
```

You can also use the [helm-push plugin](https://github.com/chartmuseum/helm-push):

`helm cm-push mychart/ chartmuseum`

</details>

<details>
	<summary>
	Installing charts into kubernetes
	</summary>
	<br />

Add the URL to your *ChartMuseum* installation to the local repository list:

```bash
helm repo add chartmuseum http://localhost:8080
```

Search for charts:

```bash
helm search repo chartmuseum/
```

Install chart:

```bash
helm install chartmuseum/mychart --generate-name
```

check it with:

curl API address with `curl -XGET x.x.x.x:8080/` - ip is ClusterIP service in k8s

</details>

${{\color{orange}\Huge{\textsf{ Typical errors: }}}}\$

`To be continued...`
