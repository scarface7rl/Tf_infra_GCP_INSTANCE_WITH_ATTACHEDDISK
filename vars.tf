variable "gcp_project" {
  type = string
  default = "authfy_csi"
}

variable "gcp_network_project" {
  type = string
  default = "shared-network-hml"
}

variable "gcp_network" {
  type = string
  default = "authfy_csi_vpc"
}

variable "gcp_subnetwork" {
  type = string
  default = "authfy_csi_vpc-subnet"
}