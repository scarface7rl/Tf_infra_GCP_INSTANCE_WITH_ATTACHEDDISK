terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.25.0"
    }
  }
}

provider "google" {
  # Configuration options
}

resource "google_compute_disk" "authfy_connectvm_disk" {
    project = var.gcp_project
    name    = "disk1"
    type    = "pd-standard"
    zone    = "southamerica-east1-a"
    size    = "100"
}
resource "google_compute_instance" "authfy_connectvm" {
    project = var.gcp_project
    name = "authfy_connectvm"
    machine_type = "e2-medium"
    zone = "southamerica-east1-a"

    boot_disk {
    initialize_params {
    image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
   }
    attached_disk {
        source      = "authfy_connectvm_disk"
        device_name = "authfy_connectvm_disk"
   }

  network_interface {
    network = var.gcp_network
    subnetwork = var.gcp_subnetwork
    subnetwork_project = var.gcp_network_project
    }

}

resource "google_compute_disk" "authfy_hubvm_disk" {
    project = "authfy-dev"
    name    = "disk2"
    type    = "pd-standard"
    zone    = "southamerica-east1-a"
    size    = "100"
}
resource "google_compute_instance" "authfy_hubvm" {
    project = "authfy-dev"
    name = "authfy_hubvm"
    machine_type = "e2-medium"
    zone = "southamerica-east1-a"

    boot_disk {
    initialize_params {
    image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
   }
    attached_disk {
        source      = "authfy_hubvm_disk"
        device_name = "authfy_hubvm_disk"
   }

  network_interface {
    network = var.gcp_network
    subnetwork = var.gcp_subnetwork
    subnetwork_project = var.gcp_network_project
    }

}

resource "google_compute_disk" "authfy_riskvm_disk" {
    project = "authfy-dev"
    name    = "disk3"
    type    = "pd-standard"
    zone    = "southamerica-east1-a"
    size    = "100"
}
resource "google_compute_instance" "authfy_riskvm" {
    project = "authfy-dev"
    name = "authfy_riskvm"
    machine_type = "e2-medium"
    zone = "southamerica-east1-a"

    boot_disk {
    initialize_params {
    image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
   }
    attached_disk {
        source      = "authfy_riskvm_disk"
        device_name = "authfy_riskvm_disk"
   }

  network_interface {
    network = var.gcp_network
    subnetwork = var.gcp_subnetwork
    subnetwork_project = var.gcp_network_project
    }

}

resource "google_compute_disk" "authfy_strongvm_disk" {
    project = "authfy-dev"
    name    = "disk4"
    type    = "pd-standard"
    zone    = "southamerica-east1-a"
    size    = "100"
}
resource "google_compute_instance" "authfy_strongvm" {
    project = "authfy-dev"
    name = "authfy_strongvm"
    machine_type = "e2-medium"
    zone = "southamerica-east1-a"

    boot_disk {
    initialize_params {
    image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
   }
    attached_disk {
        source      = "authfy_strongvm_disk"
        device_name = "authfy_strongvm_disk"
   }

  network_interface {
    network = var.gcp_network
    subnetwork = var.gcp_subnetwork
    subnetwork_project = var.gcp_network_project
    }

}

resource "google_storage_bucket" "tf_state_authfy-dev" {
  name          = "tf_state_authfy-dev${random_id.instance_id.hex}"
  force_destroy = false
  location      = "southamerica-east"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

resource "random_id" "instance_id" {
  byte_length = 8
}