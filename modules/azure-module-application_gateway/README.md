
# Modulo - Application Gateway
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Modulo desenvolvido para facilitar a criação de Applications Gateways

## Compatibilidade de Versão

| Versão do Modulo | Versão Terraform | Versão AzureRM |
|----------------|-------------------| --------------- |
| v0.1.0       | = 1.0.0 | ~> 2.97         |

## Especificando versão

Para evitar que seu código receba atualizações automáticas do modulo, é preciso informar na chave `source` do bloco do module a versão desejada, utilizando o parametro `?ref=***` no final da url. conforme pode ser visto no exemplo abaixo.

## Exemplo de uso


```hcl
module "teste_app_gw" {
  source   = "git::<repoURL>?ref=v1.0.0"
  name                  = "teste_app_gw"
  rg_name               = "resource_group"
  location              = "brazilsouth"
  pip_id                = <public IP ID>
  frontend_ip_conf_name = "ateste_app_gw_FrontendIp"
  frontend_port_settings = [{
    name = "port_80"
    port = 80
  }]
  gw_ip_conf_name = "teste_app_gw_IpConfig"
  subnet_id       = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/..."
  appgw_http_listeners = [{
    name                           = "teste_app_gw_appservice"
    frontend_ip_configuration_name = "teste_app_gw_FrontendIp"
    frontend_port_name             = "port_80"
    host_name                      = "teste_app_gw.com.br"
    protocol                       = "Http"
    require_sni                    = false
  }]
  appgw_backend_pool = [{
    name = "teste_app_gw_appservice"
    fqdns = ["teste_app_gw.azurewebsites.net"]
  }]
  appgw_backend_http_settings = [{
     name                                = "teste_app_gw_appservice"
     port                                = 80
     affinity_cookie_name                = "ApplicationGatewayAffinity"
     cookie_based_affinity               = "Enabled"
     probe_name                          = "teste_app_gw_portal"
     protocol                            = "Http"
     request_timeout                     = 20
     pick_host_name_from_backend_address = true
  }]
  appgw_probe = [{
    interval                                  = 30
    minimum_servers                           = 0
    name                                      = "teste_app_gw_portal"
    pick_host_name_from_backend_http_settings = true
    protocol                                  = "Http"
    path                                      = "/"
    timeout                                   = 30
    unhealthy_threshold                       = 3
  }]
  appgw_routings = [{
    backend_address_pool_name  = "teste_app_gw_appservice"
    backend_http_settings_name = "teste_app_gw_appservice"
    http_listener_name         = "teste_app_gw_appservice"
    name                       = "teste_app_gw_appservice"
    rule_type                  = "Basic"
  }]
  #waf
  waf_mode = "Detection"
  request_body_check = true
  rule_set_type = "OWASP"
  #rule_set_version  = "3.2"
}
```

## Entrada de Valores

| Nome | Descrição | Tipo | Padrão | Requerido |
|------|-------------|------|---------|:--------:|
| appgw_name | Nome dado ao recurso caso a opção `use_default_names` seja definida como `false` | `string` | n/a | Não |
| rg_name | o nome a ser atribuido ao RG caso a opção `use_default_names` seja definida como `false` e `create_rg` como `true` | `string` | n/a | Não |
| use_default_names | define se os recursos usarão nomes personalizados ou nomes padrões definidos no HLD | `bolean` | `true` | Não |
| create_rg | define se o código criará um RG para os recursos ou não | `bolean` | `true` | Não |
| tags | tags para serem adicionadas ao recurso | `map(string)` | `{}` | Não |
| environment | ambiente que será aplicado o código | `string` | n/a | Sim |
| solution | Nome da aplicação ou solução para qual o recurso será utilizado | `string` | n/a | Sim |
| region | região no Azure onde o arquivo será criado | `string` | `brazilsouth` | Não |
| sku | define o tipo de Gateway  | `string` | WAF_v2 | Não |
| zone | * | `list(string)` | ["1","2","3"] | Não |
| enable_http2 | * | `bool` | true | Não |
| pip_id | * | `string` | n/a | Sim |
| frontend_ip_conf_name | * | `string` | n/a | Sim |
| frontend_port_settings | * | `list(map(string))` | n/a | Sim |
| autoscaling_parameters | * | `map(string)` | null | Não |
| appgw_backend_http_settings | * | `any` | n/a | Sim |
| appgw_backend_pool | * | `any` | n/a | Sim |
| appgw_http_listeners | * | `any` | n/a | Sim |
| appgw_probe | * | `any` | n/a | Sim |
| appgw_routings | * | `any` | n/a | Sim |
| redirect_configuration" | * | `any` | Sim
| identity" | * | `any` | Sim
| trusted_root_certificate" | * | `any` | Sim
| gw_ip_conf_name | * | `string` | n/a | Sim |
| subnet_id | * | `string` | n/a | Sim |
| enable_waf | * | `bool` | true | Não |
| file_upload_limit_mb | * | `number` | 100 | Não |
| waf_mode | * | `string` | Prevention | Não |
| max_request_body_size_kb | * | `number` | 128 | Não |
| request_body_check | * | `bool` | true | Não |
| rule_set_type | * | `string` | OWASP | Não |
| rule_set_version | * | `string` | 3.0 | Sim |
| ssl_certificates | adiciona certificados ao App GW | `list(map(string))` | [] | Não
| disabled_rule_group_settings | * | `list(object({rule_group_name = string rules = list(string)}))` | n/a | Sim |
| disable_waf_rules_for_dev_portal | * | `bool` | false | Não |
| waf_exclusion_settings | * | `list(map(string))` | [] | Não |

## Saída de Valores

| Nome | Descrição |
|------|-------------|


## Documentação de Referência

Terraform Application Gateway: [https://registry.terraform.io/providers/azurerm/latest/docs/resources/application_gateway](https://registry.terraform.io/providers/azurerm/latest/docs/resources/application_gateway)
