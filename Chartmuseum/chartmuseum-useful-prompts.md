## Useful prompts:

### helm chart repository:

`GET /index.yaml` - retrieved when you run `helm repo add chartmuseum http://localhost:8080/`

`GET /charts/mychart-0.1.0.tgz` - retrieved when you run `helm install chartmuseum/mychart`

`GET /charts/mychart-0.1.0.tgz.prov` - retrieved when you run `helm install` with the `-verify` flag

### chart manipulation:

`curl -L --data-binary "@<packge-name>" <chartmuseum-url>/api/charts` - upload chart to repo

`POST /api/charts` - upload a new chart version

`POST /api/prov` - upload a new provenance file

`DELETE /api/charts/<name>/<version>` - delete a chart version (and corresponding provenance file)

`GET /api/charts` - list all charts

`GET /api/charts/<name>` - list all versions of a chart

`GET /api/charts/<name>/<version>` - describe a chart version

`GET /api/charts/<name>/<version>/templates` - get chart template

`GET /api/charts/<name>/<version>/values` - get chart values

`HEAD /api/charts/<name>` - check if chart exists (any versions)

`HEAD /api/charts/<name>/<version>` - check if chart version exists

### server info:

`GET /` - HTML welcome page

`GET /info` - returns current ChartMuseum version

`GET /health` - returns 200 OK

´´´´Deprecated´´´´

```Deprecated```

```diff
! test
+ test
- test
# test
@@ test @@
```

> [!IMPORTANT]
> Key information users need to know to achieve their goal.
