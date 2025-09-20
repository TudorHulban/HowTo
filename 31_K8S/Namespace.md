# Create namespace

Create configuration file:

```json
{
  "apiVersion": "v1",
  "kind": "Namespace",
  "metadata": {
    "name": "test",
    "labels": {
      "name": "test"
    }
  }
}
```

Apply created file:

```sh
kubectl create -f create_namespace.json 
```

Verify newly created namespace:

```sh
kubectl get namespace
```

## Resources

```html
https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/#working-with-namespaces
https://www.fosstechnix.com/how-to-create-new-namespace-in-kubernetes/
```
