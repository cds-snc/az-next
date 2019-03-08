workflow "Build, test, and deploy on push" {
  on = "push"
  resolves = [
    "Deploy from DockerHub to Azure Container Instance"
  ]
}

action "Install npm dependencies" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "Run JS linter" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Install npm dependencies"]
  args = "run lint"
}

action "Run Jest unit tests" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "test"
  needs = ["Install npm dependencies"]
}

action "If workflow branch" {
  uses = "actions/bin/filter@24a566c2524e05ebedadef0a285f72dc9b631411"
  needs = ["Run Jest unit tests", "Run JS linter"]
  args = "branch workflow"
}

action "Login into Docker Hub" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["If workflow branch"]
}

action "Build a Docker container" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Login into Docker Hub"]
  args = "build -t base ."
}

action "Tag base container" {
  uses = "actions/docker/tag@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Build a Docker container"]
  args = "base cdssnc/az-next --no-ref --env"
}

action "Push container to Docker Hub" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Tag base container"]
  args = "push cdssnc/az-next"
}

action "Login to Azure" {
  uses = "Azure/github-actions/login@d0e5a0afc6b9d8d19c9ade8e2446ef3c20e260d4"
  needs = ["Push container to Docker Hub"]
  secrets = ["AZURE_SERVICE_APP_ID", "AZURE_SERVICE_PASSWORD", "AZURE_SERVICE_TENANT"]
}

action "Deploy from DockerHub to Azure Container Instance" {
  uses = "Azure/github-actions/cli@d0e5a0afc6b9d8d19c9ade8e2446ef3c20e260d4"
  needs = ["Login to Azure"]
  env = {
    AZURE_SCRIPT = "az container create --resource-group az-next-rg --name az-next --image cdssnc/az-next:${IMAGE_SHA} --dns-name-label az-next-demo"
  }
}
