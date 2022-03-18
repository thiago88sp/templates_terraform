data "azurerm_resources" "appgws" {
  type = "Microsoft.Network/applicationGateways"
  required_tags = {
    system      = "AppGateway"
    environment = lower(var.environment)
  }
}

resource "azurerm_resource_group" "rg_appgw" {
  for_each = toset(local.resource_group)
  name     = local.rg_name
  location = var.region
  tags     = merge(local.default_tags, var.tags)
  lifecycle {
    ignore_changes = [  
      tags["create_date"]
    ]
  }
}
resource "azurerm_application_gateway" "app_gw" {
  name                = local.appgw_name
  location            = var.region
  resource_group_name = var.create_rg ? azurerm_resource_group.rg_vm["resource_group"].name : var.rg_name
  tags                = merge(local.default_tags, var.tags)
  sku {
    capacity = var.autoscaling_parameters != null ? null : var.sku_capacity
    name     = var.sku
    tier     = var.sku
  }
  zones        = var.zones
  enable_http2 = var.enable_http2
  frontend_ip_configuration {
    public_ip_address_id = var.pip_id
    name                 = var.frontend_ip_conf_name
  }
  dynamic "frontend_port" {
    for_each = var.frontend_port_settings
    content {
      name = lookup(frontend_port.value, "name", null)
      port = lookup(frontend_port.value, "port", null)
    }
  }
  gateway_ip_configuration {
    name      = var.gw_ip_conf_name
    subnet_id = var.subnet_id
  }
  dynamic "http_listener" {
    for_each = var.appgw_http_listeners
    content {
      name                           = lookup(http_listener.value, "name", null)
      firewall_policy_id             = lookup(http_listener.value, "firewall_policy_id", null)
      frontend_ip_configuration_name = lookup(http_listener.value, "frontend_ip_configuration_name", null)
      frontend_port_name             = lookup(http_listener.value, "frontend_port_name", null)
      host_name                      = lookup(http_listener.value, "host_name", null)
      protocol                       = lookup(http_listener.value, "protocol", null)
      require_sni                    = lookup(http_listener.value, "require_sni", null)
      ssl_certificate_name           = lookup(http_listener.value, "ssl_certificate_name", null)
    }
  }
  dynamic "backend_address_pool" {
    for_each = var.appgw_backend_pool
    content {
      name         = lookup(backend_address_pool.value, "name", null)
      ip_addresses = lookup(backend_address_pool.value, "ip_addresses", null)
      fqdns        = lookup(backend_address_pool.value, "fqdns", null)
    }
  }
  dynamic "backend_http_settings" {
    for_each = var.appgw_backend_http_settings
    content {
      name       = lookup(backend_http_settings.value, "name", null)
      path       = lookup(backend_http_settings.value, "path", "")
      probe_name = lookup(backend_http_settings.value, "probe_name", null)

      affinity_cookie_name                = lookup(backend_http_settings.value, "affinity_cookie_name", "ApplicationGatewayAffinity")
      cookie_based_affinity               = lookup(backend_http_settings.value, "cookie_based_affinity", "Disabled")
      pick_host_name_from_backend_address = lookup(backend_http_settings.value, "pick_host_name_from_backend_address", true)
      host_name                           = lookup(backend_http_settings.value, "host_name", null)
      port                                = lookup(backend_http_settings.value, "port", 443)
      protocol                            = lookup(backend_http_settings.value, "protocol", "Https")
      request_timeout                     = lookup(backend_http_settings.value, "request_timeout", 20)
      trusted_root_certificate_names      = lookup(backend_http_settings.value, "trusted_root_certificate_names", [])
      dynamic "connection_draining" {
        for_each = lookup(backend_http_settings.value,"connection_draining" , false)  ? ["enabled"] : []
        content {
          drain_timeout_sec = connection_draining.value == "enabled" ? 60 : null
          enabled           = connection_draining.value == "enabled" ? true : null
        }
      }
    }
  }
  dynamic "probe" {
    for_each = var.appgw_probe
    content {
      host                                      = lookup(probe.value, "host", null)
      interval                                  = lookup(probe.value, "interval", 30)
      name                                      = lookup(probe.value, "name", null)
      path                                      = lookup(probe.value, "path", "/")
      port                                      = lookup(probe.value, "port", null)
      protocol                                  = lookup(probe.value, "protocol", "Https")
      timeout                                   = lookup(probe.value, "timeout", 30)
      pick_host_name_from_backend_http_settings = lookup(probe.value, "pick_host_name_from_backend_http_settings", false)
      unhealthy_threshold                       = lookup(probe.value, "unhealthy_threshold", 3)
      match {
        body        = lookup(probe.value, "match_body", "")
        status_code = lookup(probe.value, "match_status_code", null)
      }
    }
  }
  dynamic "redirect_configuration" {
    for_each = var.redirect_configuration
    content {
      name = lookup(redirect_configuration.value, "name", null)
      redirect_type = lookup(redirect_configuration.value, "redirect_type", null)
      target_listener_name = lookup(redirect_configuration.value, "target_listener_name", null)
      target_url = lookup(redirect_configuration.value, "target_url", null)
      include_path = lookup(redirect_configuration.value, "include_path", null)
      include_query_string = lookup(redirect_configuration.value, "include_query_string", null)
    }
  }
  dynamic "request_routing_rule" {
    for_each = var.appgw_routings
    content {
      name      = lookup(request_routing_rule.value, "name", null)
      rule_type = lookup(request_routing_rule.value, "rule_type", "Basic")

      http_listener_name          = lookup(request_routing_rule.value, "http_listener_name", lookup(request_routing_rule.value, "name", null))
      backend_address_pool_name   = lookup(request_routing_rule.value, "backend_address_pool_name", lookup(request_routing_rule.value, "name", null))
      backend_http_settings_name  = lookup(request_routing_rule.value, "backend_http_settings_name", lookup(request_routing_rule.value, "name", null))
      url_path_map_name           = lookup(request_routing_rule.value, "url_path_map_name", null)
      redirect_configuration_name = lookup(request_routing_rule.value, "redirect_configuration_name", null)
      rewrite_rule_set_name       = lookup(request_routing_rule.value, "rewrite_rule_set_name", null)
    }
  }
  dynamic "identity" {
    for_each = var.identity
    content {
      type = lookup(identity.value, "type", null)
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }
  dynamic "trusted_root_certificate" {
    for_each = var.trusted_root_certificate
    content {
      name = lookup(trusted_root_certificate.value, "name", null)
      data = lookup(trusted_root_certificate.value, "data", null)
    }
  }
  dynamic "waf_configuration" {
    for_each = local.enable_waf ? ["fake"] : []
    content {
      enabled                  = var.enable_waf
      file_upload_limit_mb     = coalesce(var.file_upload_limit_mb, 100)
      firewall_mode            = coalesce(var.waf_mode, "Prevention")
      max_request_body_size_kb = coalesce(var.max_request_body_size_kb, 128)
      request_body_check       = var.request_body_check
      rule_set_type            = var.rule_set_type
      rule_set_version         = var.rule_set_version

      dynamic "disabled_rule_group" {
        for_each = local.disabled_rule_group_settings
        content {
          rule_group_name = lookup(disabled_rule_group.value, "rule_group_name", null)
          rules           = lookup(disabled_rule_group.value, "rules", null)
        }
      }
      dynamic "exclusion" {
        for_each = var.waf_exclusion_settings
        content {
          match_variable          = lookup(exclusion.value, "match_variable", null)
          selector                = lookup(exclusion.value, "selector", null)
          selector_match_operator = lookup(exclusion.value, "selector_match_operator", null)
        }
      }
    }
  }
  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name                = lookup(ssl_certificate.value, "name", null)
      data                = lookup(ssl_certificate.value, "data", null)
      password            = lookup(ssl_certificate.value, "password", null)
      key_vault_secret_id = lookup(ssl_certificate.value, "key_vault_secret_id", null)
    }
  }
  lifecycle {
    ignore_changes = [
      name,
      tags["create_date"]
    ]
  }
}