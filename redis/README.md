<div align="center" id="top"> 
  <img src="https://user-images.githubusercontent.com/54182968/127691383-c0920320-7613-4a82-8897-079ade577ea6.png" alt="Redis" />


  &#xa0;

  <!-- <a href="https://redis.netlify.app">Demo</a> -->
</div>

<h1 align="center">Redis</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/{{THIAGO88SP}}/redis?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/{{thiago88sp}}/redis?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/{{thiago88sp}}/redis?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/{{thiago88sp}}/redis?color=56BEB8">

  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/{{thiago88sp}}/redis?color=56BEB8" /> -->

  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/{{thiago88sp}}/redis?color=56BEB8" /> -->

  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/{{thiago88sp}}/redis?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center"> 
	🚧  Redis 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/{{thiago88sp}}" target="_blank">Author</a>
</p>

<br>

## :dart: About ##

Describe your project

## :sparkles: Features ##

:heavy_check_mark: Azure Redis Cache Provisioning;\

## :rocket: Technologies ##

The following tools were used in this project:

- [Terraform](https://www.terraform.io/)

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com), [AZ CLI](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli) and [Terraform](https://www.terraform.io/) installed.

## :checkered_flag: Starting ##

```bash
# Clone this project
$ git clone https://github.com/thiago88sp/templates_terraform/tree/main/redis

# Access
$ cd redis

# Longon on to Azure
az login

# Select your subscription (In case to have two or more subscription)
az account set --subscription

#Initialize state in backend. The terraform init command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times.
terraform init --backend-config vars/backend.hcl

#Run the command to get the execution plan. The terraform plan command creates an execution plan.
terraform plan -var-file vars/main.tfvars

#Perform the terraform apply. The terraform apply command executes the actions proposed in a Terraform plan.
terraform apply -var-file vars/main.tfvars

```

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/thiago88sp" target="_blank">{{Thiago Pontes}}</a>

&#xa0;

<a href="#top">Back to top</a>
