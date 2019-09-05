# Terraform Service Principal

## Introduction

This module deploys an Azure AD application and service principal with the option of assigning the newly created service principal to an existing Azure AD group.

## Security Controls

The following security controls can be met through configuration of this template:

* TBD

## Dependancies

* None

## Usage

```terraform
module "sp_user1" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-service-principal?ref=20190905.1"

  sp_name = "some-sp-name"
  group_member = ["b6d197ec-1122-420e-81ca-03b8f2854613", "c5d197ec-1122-420e-81ca-03b8f2854624"]
}
```

## Variables Values

| Name         | Type   | Required | Value                                    |
| ------------ | ------ | -------- | ---------------------------------------- |
| sp_name      | string | yes      | Name of the service principal            |
| group_member | list   | no       | List of Azure AD Group id. Default: null |

## History

| Date     | Release    | Change      |
| -------- | ---------- | ----------- |
| 20190905 | 20190905.1 | 1st release |
