resource "harness_platform_secret_text" "github_pat" {
  identifier                = "github_pat"
  name                      = "github_pat"
  description               = ""
  tags                      = []
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.github_pat
}

resource "harness_platform_secret_text" "dockerhub_pat" {
  identifier                = "dockerhub_pat"
  name                      = "dockerhub_pat"
  description               = ""
  tags                      = []
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = var.dockerhub_pat
}
