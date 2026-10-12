variable "account_id" {
    type = string
    default = ""
}

variable "project_id" {
    type = string
    default = ""
}

variable "org_id" {
    type = string
    default = ""
}

variable "k3d_cluster_name" {
    type = string
    default = ""
}

variable "agent_identifier" {
    type = string
    default = ""
}

variable "agent_name" {
    type = string
    default = ""
}

variable "agent_namespace" {
    type = string
    default = ""
}

variable "dockerhub_username" {
    type = string
    default = ""
}

variable "dockerhub_pat" {
    type = string
    default = ""
    sensitive = true
}

variable "github_username" {
    type = string
    default = ""
}

variable "github_pat" {
    type = string
    default = ""
    sensitive = true
}

variable "repo_identifier" {
    type = string
    default = ""
}

variable "repo_name" {
    type = string
    default = ""
}

variable "repo_url" {
    type = string
    default = ""
}

variable "cluster_identifier" {
    type = string
    default = ""
}

variable "cluster_name" {
    type = string
    default = ""
}

variable "env_identifier" {
    type = string
    default = ""
}

variable "env_name" {
    type = string
    default = ""
}

variable "service_name" {
    type = string
    default = ""
}

variable "harness_api_token" {
    type = string
    default = ""
    sensitive = true
}

variable "delegate_token" {
    type = string
    default = ""
    sensitive = true
}

variable "delegate_manager_endpoint" {
    type = string
    default = "https://app.harness.io"
}

variable "delegate_image" {
    type = string
    default = "harness/delegate:23.11.81601"
}
