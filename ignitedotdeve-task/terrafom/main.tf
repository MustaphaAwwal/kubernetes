resource "kubectl_manifest" "test" {
  yaml_body = <<YAML
apiVersion: v1
kind: Pod
metadata:
  name: ignite-dev
  labels:
    app: simple-node
spec:
  containers:
  - name: awwal-simplehello
    image: awwalmustapha/ignitedeve-hello
    ports:
    -  containerPort: 3000
YAML
}
resource "kubectl_manifest" "ignite-service" {
  yaml_body = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: ignite-service
spec:
  type: NodePort
  ports:
  - targetPort: 3000
    port: 80
    nodePort: 30000
  selector:
    app: simple-node
YAML
}

resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stackr"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  timeout    = 600
}
