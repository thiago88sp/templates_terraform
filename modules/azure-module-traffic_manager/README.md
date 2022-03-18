# terraform-azure-traffic-manager

Azure Traffic Manager is a DNS-based traffic load balancer. This service allows you to distribute traffic to your public facing applications across the global Azure regions. Traffic Manager also provides your public endpoints with high availability and quick responsiveness.

This module contains a Traffic Manager Profile resource (traffic routing method, dns settings and endpoint monitor configuration) and will loop through a for_each to configure Traffic Manager Endpoints.

## Usage

```hcl
module "traffic_manager" {
  source                 = "guidalabs/terraform-azure-traffic-manager"
  resource_group_name    = azurerm_resource_group.main.name
  profile_name           = "trafficmanager"
  traffic_routing_method = "MultiValue"
  max_return             = 3
  monitor_port           = 6001
  traffic_manager_endpoints = {
    user1_vmss_0 = {
      target_ip = "1.1.1.1"
      weight    = "100"
    },
    user1_vmss_1 = {
      target_ip = "2.2.2.2"
      weight    = "101"
    },
    user2_vmss_0 = {
      target_ip = "3.3.3.3"
      weight    = "102"
    },
  }
}
```

See [Configuration](configuration.md)
