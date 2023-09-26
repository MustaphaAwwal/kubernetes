provider "kubernetes" {
  config_path = "$HOME/.kube/$CLUSTER_NAME-config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/awwal-config"
    config_context = "kind-awwal"
  }
}
