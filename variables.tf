############################
## General Init Variables ##
############################

variable "subscription_id" {
  description = "Azure Subscription. Define via enviroment variable TF_VAR_subscription_id = <YOUR_SUBSCRIPTION_ID>"
}

variable "tenant_id" {
  description = "Azure Subscription. Define via enviroment variable TF_VAR_tenant_id = <YOUR_TENANT_ID>"
}

variable "client_id" {
  description = "Azure Subscription. Define via enviroment variable TF_VAR_client_id = <YOUR_CLIENT_ID>"
}

variable "client_secret" {
  description = "Azure Subscription. Define via enviroment variable TF_VAR_client_secret = <YOUR_CLIENT_SECRET>"
}

variable "tags" {
  description = "tags to apply to the resources"
  default     = {}
}

variable "create_resource_group" {
  description = "Option to create a Azure resource group to use for VNET"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group to use for the VNET, it is used in both cases even if the resource group is created"
  type        = string
  default     = "myRG"
}

variable "resource_group_location" {
  description = "Location for resource group See. https://azure.microsoft.com/en-us/global-infrastructure/locations/"
  type        = string
  default     = "West Europe"
}

variable "vnet_cidr" {
  description = "The CIDR block for VNET"
  type        = list
  default     = ["172.16.0.0/16"]
}

variable "vnet_name" {
  description = "Name of the VNET"
  type        = string
  default     = "myVNET"
}

variable "vnet_dns_servers" {
  description = "Optional dns servers to use for VNET"
  type        = list
  default     = []
}

variable "subnets" {
  description = "Map of subnet objects. name, cidr, and service_endpoints supported"
  type = map(object({
    cidr              = string
    service_endpoints = list(string)
  }))
  default = {}
}

variable "k8s_version" {
  description = "K8s version to deploy in AKS. run `az aks get-versions` for a list of qualified values"
}

variable "node_pools" {
  type = map(object({
    node_count = number
    vm_size    = string
    os_type    = string
  }))
  default = {}
}

variable "apps" {
  type = map(object({
    version = string
  }))
  default = {}
}

variable "repo_name" {
  description = "name of the ACR holding the charts"
}

variable "repo_username" {
  description = "Admin username of the ACR"
}

variable "repo_password" {
  description = "Admin password of the ACR"
}

variable "default_pool_node_count" {
  description = "number of nodes in the default pool"
  default     = 1
}

variable "zone_name" {
  description = "the name of the dns zone"
  default     = "jungo.guru"
}
