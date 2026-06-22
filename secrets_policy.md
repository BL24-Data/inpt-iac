name: Terraform CI/CD

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  validate:
    name: Validation syntaxe
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Installer Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.7.5

      - name: Terraform Init
        run: terraform init -backend=false

      - name: Verifier le formatage
        run: terraform fmt -check -recursive

      - name: Valider la syntaxe
        run: terraform validate