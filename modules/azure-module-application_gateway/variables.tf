variable "subscription_id" {
  type = string
  validation {
    condition     = length(split("-", var.subscription_id)) == 5
    error_message = "Subscription Format Error."
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "environment" {
  type = string
  default = "shared"
}
variable "solution" {
  type = string
  validation {
    condition = length(var.solution) < 7
    error_message = "This value most be have until 7 caracteres."
  }
}
variable "region" {
  type    = string
}

variable "rg_name" {
  type = string
  default = null
}
variable "create_rg" {
  type = bool
  default = true
}
variable "use_default_names" {
  type = bool
  default = true
}

variable "appgw_name" {
  type = string
  default = null
}

variable "sku_capacity" {
  type    = number
  default = 1
}
variable "sku" {
  type    = string
  default = "WAF_v2"
}
variable "zones" {
  type    = list(string)
  default = ["1", "2", "3"]
}
variable "enable_http2" {
  type    = bool
  default = true
}
variable "pip_id" {
  type = string
}
variable "frontend_ip_conf_name" {
  type = string
}
variable "frontend_port_settings" {
  type = list(map(string))
}
variable "autoscaling_parameters" {
  type    = map(string)
  default = null
}
variable "appgw_backend_http_settings" {
  type = any
}
variable "appgw_backend_pool" {
  type = any
}
variable "appgw_http_listeners" {
  type = any
}
variable "redirect_configuration" {
  type = any
}
variable "identity" {
  type = any
}
variable "trusted_root_certificate" {
  type  = any
}
variable "appgw_probe" {
  type = any
}
variable "appgw_routings" {
  type = any
}
variable "gw_ip_conf_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "enable_waf" {
  type    = bool
  default = true
}
variable "file_upload_limit_mb" {
  type    = number
  default = 100
}
variable "waf_mode" {
  type    = string
  default = "Prevention"
}
variable "max_request_body_size_kb" {
  type    = number
  default = 128
}
variable "request_body_check" {
  type    = bool
  default = true
}
variable "rule_set_type" {
  type    = string
  default = "OWASP"
}
variable "rule_set_version" {
  type    = string
  default = "3.0"
}
variable "disabled_rule_group_settings" {
  type = list(object({
    rule_group_name = string
    rules           = list(string)
  }))
  default = []
}
variable "disable_waf_rules_for_dev_portal" {
  type    = bool
  default = false
}
variable "waf_exclusion_settings" {
  type    = list(map(string))
  default = []
}
variable "ssl_certificates" {
  type    = list(map(string))
  default = []
}