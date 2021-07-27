# Providers
terraform {
    required_providers {
        flux = {
            source = "fluxcd/flux"
        }
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "2.3.2"
        }
        kubectl = {
            source  = "gavinbunney/kubectl"
            version = "1.10.0"
        }
    }
}

data "aws_eks_cluster" "example-cluster" {
  name = "example-cluster"
}
data "aws_eks_cluster_auth" "example-cluster" {
  name = "example-cluster"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.example-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example-cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

# Configure Flux v2 bootstrapper
provider "flux" {}

# Configure Kubernetes provider

provider "kubectl" {
}

provider "aws" {
    region = "eu-west-2"
}
