# eks_flux2_terraform

# (Guide here)[https://joshuajordancallis.medium.com/setup-eks-and-flux-2-with-terraform-c9677eea5731?postPublishedType=initial]

# Cluster 1.20

Navigate to `eks/cluster.yaml`

Run the blow command in the CLI.
```bash
#!/bin/bash
eksctl create cluster --config-file cluster.yml
```

This can take upto an hour, this will create the Kubernetes cluster in EKS aws.


# flux 2

Install

Homebrew
```bash
brew install fluxcd/tap/flux
```

or bash:

```bash
curl -s https://fluxcd.io/install.sh | sudo bash

# enable completions in ~/.bash_profile
. <(flux completion bash)
```

# Check the cluster meets the requirements 
(shoudnt have any issues)
```bash
flux check --pre
```

# Setup flux in the cluster via the bootstrap method

flux 2 provisioned via terraform. See, `flux2/...` 

# To use the make file
run 
```bash
make plan
```
once you are happy with the plan apply it via.
```bash
make build
```


