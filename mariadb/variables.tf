#variable "prefix" {
#  type        =  string    
#  description = "The prefix which should be used for all resources in this example"
#}
variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "sku" {
  description = "SKU chosed in the APIM"
}
