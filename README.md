# trade-tariff-platform-terraform

This repository contains multiple terraform projects that offer up terraform to terragrunt located at trade-tariff-platform-terragrunt to be deployed. At the moment the project operates as two units, the CDN and a common package which we indend to migrate into seperate modules very soon which can then be consumed correctly rather than the current legacy form.

An outline of this project is below:
```
terraform/
├── cdn # This is used to create our cdn resources
├── common # This is used to create commonly used resources
```

Our modules which previously sat in this repository have been moved out to trade-tariff-platform-terraform-modules