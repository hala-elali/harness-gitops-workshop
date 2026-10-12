resource "helm_release" "podinfodelegate" {
  name       = "podinfodelegate"
  repository = "https://app.harness.io/storage/harness-download/delegate-helm-chart/"
  chart      = "harness-delegate-ng"
  values = [
    file("${path.module}/values.yaml")
  ]
  set {
    name  = "delegateName"
    value = "podinfodelegate"
    type  = "string"
  }
  set {
    name  = "accountId"
    value = var.account_id
    type  = "string"
  }
  set_sensitive {
    name  = "delegateToken"
    value = var.delegate_token
    type  = "string"
  }
  set {
    name  = "managerEndpoint"
    value = var.delegate_manager_endpoint
    type  = "string"
  }
  set {
    name  = "delegateDockerImage"
    value = var.delegate_image
    type  = "string"
  }
  set {
    name  = "replicas"
    value = 1
  }
  set {
    name  = "upgrader.enabled"
    value = true
  }
}
