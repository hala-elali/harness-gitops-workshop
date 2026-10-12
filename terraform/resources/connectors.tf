resource "harness_platform_connector_github" "github_appset_repo_connector" {
  identifier  = "github_appset_repo_connector"
  name        = "github_appset_repo_connector"
  description = ""
  tags        = []

  url             = var.repo_url
  connection_type = "Repo"
  credentials {
    http {
      username  = var.github_username
      token_ref = "account.${harness_platform_secret_text.github_pat.identifier}"
    }
  }
  api_authentication {
    token_ref = "account.${harness_platform_secret_text.github_pat.identifier}"
  }
  execute_on_delegate = false
}

resource "harness_platform_connector_docker" "dockerhub_connector" {
  identifier  = "dockerhub_connector"
  name        = "dockerhub_connector"
  description = ""
  tags        = []

  type                = "DockerHub"
  url                 = "https://index.docker.io/v2/"
  execute_on_delegate = false
  credentials {
    username     = var.dockerhub_username
    password_ref = "account.${harness_platform_secret_text.dockerhub_pat.identifier}"
  }
}
