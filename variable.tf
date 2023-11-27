variable "location" {
  description = "The Azure region where the resources will be created."
  default     = "germanywestcentral"
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  default     = "example-resource-group"
}

variable "github_repo_url" {
  description = "The URL of your GitHub repository."
}
