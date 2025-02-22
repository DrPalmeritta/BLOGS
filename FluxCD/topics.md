${{\color{orange}\Huge{\textsf{ Topics data: }}}}\$

<details>
	<summary>
	Installing and Bootstrapping FluxCD via GitHub
	</summary>
	<br />

> Flux is a set of continuous and progressive delivery solutions for Kubernetes that are open and extensible. Here’s how you can install the Flux CLI and bootstrap it with your GitHub repository.

### Install the Flux CLI
To install the Flux CLI, you have two main options: Homebrew for macOS or a Bash script for both macOS and Linux.

Using Homebrew (macOS):

```bash
brew install fluxcd/tap/flux
```

Using Bash (macOS and Linux):
```bash
curl -s https://fluxcd.io/install.sh | sudo bash
```

After installation, verify it was successful by running:

```bash
flux check --pre
```

### Set Up GitHub Credentials
Before bootstrapping Flux, you need to set up your GitHub credentials. This includes your Personal Access Token (PAT), repository name, and GitHub username.

```bash
# Your GitHub Personal Access Token
export GITHUB_TOKEN=<your-token>

# Your GitHub repository name
export GITHUB_REPO=<your-repo>

# Your GitHub username
export GITHUB_USER=<your-username>
```

### Bootstrap Flux with Your GitHub Repository
Now that your credentials are set, you can bootstrap Flux. This process connects your Kubernetes cluster to your GitHub repository, enabling continuous delivery.

```bash
flux bootstrap github \
--owner=$GITHUB_USER \
--repository=$GITHUB_REPO \
--branch=main \
--path=clusters/staging #OPTIONAL DUE TO FLUX-REPO STRUCTURE
```

### Verify Bootstrap
To ensure the bootstrap process was successful, check the resources in the flux-system namespace:

```bash
kubectl get all -n flux-system
```

By following these steps, you'll have Flux installed and bootstrapped with your GitHub repository, ready to automate your Kubernetes deployments.

</details>

<details>
	<summary>
	Generating Flux Resources via CLI
	</summary>
	<br />

> Flux makes managing your Kubernetes resources straightforward by using declarative YAML files. Here’s how to generate GitRepository and Kustomization resource YAML files using the Flux CLI.

### Generate GitRepository Resource YAML
The GitRepository resource defines the source of your configuration. This example uses a repository hosted on GitHub.

Run the following command to generate the GitRepository resource YAML:

```bash
flux create source git podinfo \
--url=https://github.com/$GITHUB_USER/podinfo-app \
--branch=main \
--interval=30s \
--export > ./clusters/my-cluster/podinfo-source.yaml
```

Explanation:

`podinfo` - The name of the Git source.<br />
`--url=https://github.com/$GITHUB_USER/podinfo-app` - The URL of the Git repository with specified user from ENV variable.<br />
`--branch=main` - The branch to track.<br />
`--interval=30s` - How often Flux should check the repository for updates.<br />
`--export > ./clusters/my-cluster/podinfo-source.yaml` - Exports the configuration to a YAML file.<br />

### Generate Kustomization Resource YAML
The Kustomization resource defines how the configurations in the Git repository should be applied to the Kubernetes cluster.

Run the following command to generate the Kustomization resource YAML:

```bash
flux create kustomization podinfo \
--target-namespace=default \
--source=podinfo \
--path="./kustomize" \
--prune=true \
--interval=5m \
--export > ./clusters/my-cluster/podinfo-kustomization.yaml
```

Explanation:

`podinfo` - The name of the Kustomization.<br />
`--target-namespace=default` - The Kubernetes namespace where resources should be applied.<br />
`--source=podinfo` - The name of the Git source defined in the previous step.<br />
`--path="./kustomize"` - The path within the repository to find the Kubernetes manifests.<br />
`--prune=true` - Ensures that resources not defined in the source are deleted.<br />
`--interval=5m` - How often Flux should apply the configuration.<br />
`--export > ./clusters/my-cluster/podinfo-kustomization.yaml` - Exports the configuration to a YAML file.<br />

By following these steps, you'll generate the necessary YAML files for managing your Kubernetes resources with Flux. These files can be committed to your Git repository to enable continuous deployment and automated management of your cluster resources.

</details>

<details>
	<summary>
	Overlay Kustomization resources in Flux-like cluster structure
	</summary>
	<br />

```bash
fluxcd-repo-name/
├── apps/
│   ├── production-app/
│   │   ├── base/
│   │   │   ├── kustomization.yml
│   │   │   └── deployment.yml
│   │   └── overlays/
│   │       ├── dev/
│   │       │   ├── kustomization.yml
│   │       │   └── patch.yml
│   │       └── prod/
│   │           ├── kustomization.yml
│   │           └── patch.yml
```

kustomization.yml example:
```yaml
bases:
  - ../../base
patchesStrategicMerge:
  - patch.yaml

```

patch.yml example:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: dev
spec:
  replicas: 3 #rewriting for test purpose

```

</details>

<details>
	<summary>
	Sync helmRelease with given external Values.yaml template
	</summary>
	<br />

While the support for external source references has been dropped, it is possible to work around this limitation by creating a CronJob that periodically fetches the values from an external URL and saves them to a ConfigMap or Secret resource.

First, create a ServiceAccount, Role and RoleBinding capable of updating a limited set of ConfigMap resources:

```yaml
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: values-fetcher
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: configmap-updater
  namespace: default
rules:
- apiGroups: [""]
  resources: ["configmaps"]
  # ResourceNames limits the access of the role to
  # a defined set of ConfigMap resources
  resourceNames: ["my-external-values"]
  verbs: ["patch", "get"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: update-values-configmaps
  namespace: default
subjects:
- kind: ServiceAccount
  name: values-fetcher
  namespace: default
roleRef:
  kind: Role
  name: configmap-updater
  apiGroup: rbac.authorization.k8s.io
```

As resourceNames scoping in the Role does not allow restricting create requests, we need to create empty placeholder(s) for the ConfigMap resource(s) that will hold the fetched values:

```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-external-values
  namespace: default
data: {}
```

Lastly, create a CronJob that uses the ServiceAccount defined above, fetches the external values on an interval, and applies them to the ConfigMap:

```yaml
---
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: fetch-external-values
spec:
  concurrencyPolicy: Forbid
  schedule: "*/5 * * * *"
  successfulJobsHistoryLimit: 3
  failedJobsHistoryLimit: 3
  jobTemplate:
    spec:
      template:
        spec:
          serviceAccountName: values-fetcher
          containers:
          - name: kubectl
            image: bitnami/kubectl:1.19
            volumeMounts:
            - mountPath: /tmp
              name: tmp-volume
            command:
            - sh
            - -c
            args:
            - >-
              curl -f -# https://example.com/path/to/values.yaml -o /tmp/values.yaml &&
              kubectl create configmap my-external-values --from-file=/tmp/values.yaml -oyaml --dry-run=client |
              kubectl apply -f -              
          volumes:
          - name: tmp-volume
            emptyDir:
              medium: Memory
          restartPolicy: OnFailure
```

You can now refer to the my-external-values ConfigMap resource in your HelmRelease:

```yaml
---
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: my-release
  namespace: default
spec:
  # ...omitted for brevity
  valuesFrom:
  - kind: ConfigMap
    name: my-external-values
```

</details>
