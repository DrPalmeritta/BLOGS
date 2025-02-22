${{\color{orange}\Huge{\textsf{ Useful prompts: }}}}\$

${{\color{MidnightBlue}\large{\textsf{ main: }}}}\$

`kubectl get all -n flux-system` - see the whole list od resources created for flux environment

`flux get kustomizations --watch` - realtime kustomizations output

`flux logs` - see flux logs

`flux get all —-all-namespaces` - see all resources

`flux get helmreleases --all-namespaces` - see all helm releases from all namespaces

`flux trace kustomization/[source_name]` - get info about specific kustomization

`kubectl describe -n [namespace] gitrepository flux-system` - describe specified gitrepository manifest

${{\color{MidnightBlue}\large{\textsf{ delete: }}}}\$

`flux delete kustomization [source_name]` - delete specified kustomization

`flux delete source git [source_name]` - delete specified source

`flux uninstall --namespace=flux-system --keep-namespace` - full uninstall fluxcd manager
