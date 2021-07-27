variable "cluster_name" {
    type = string
}

variable "github_owner" {
  type        = string
  description = "github owner"
}

variable "repository_name" {
  type        = string
  default     = "test-provider"
  description = "github repository name"
}
