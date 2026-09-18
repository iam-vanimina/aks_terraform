Here's how to check and manage your current AKS context (which cluster/namespace `kubectl` is pointed at):

**Show current context**
```bash
kubectl config current-context
```

**List all contexts**
```bash
kubectl config get-contexts
```
The one with `*` in the first column is active.

**Show full kubeconfig details**
```bash
kubectl config view
kubectl config view --minify          # only current context's details
```

**Switch context** (if you have multiple clusters configured)
```bash
kubectl config use-context <context-name>
```

**Set/check current namespace within context**
```bash
kubectl config set-context --current --namespace=roboshop
kubectl config view --minify | grep namespace
```

**Rename a context**
```bash
kubectl config rename-context <old-name> <new-name>
```

**Delete a context**
```bash
kubectl config delete-context <context-name>
```

**Verify which cluster you're actually hitting**
```bash
kubectl cluster-info
kubectl config current-context
az aks show --resource-group roboshop-rg --name roboshop-aks --query "name" -o tsv
```

If you have credentials for multiple AKS clusters merged into one kubeconfig, `get-contexts` is the quickest way to confirm you're not accidentally running commands against the wrong cluster before you `apply` or `delete` anything.