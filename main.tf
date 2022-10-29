terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.32.0"
    }
  }
  backend "gcs" {
    bucket  = "gcf-sources-211648919762-us-central1"
    prefix  = "terraform/state"
  }  
}

provider "google" {
  # Configuration options
  project = "true-eye-360908"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform123"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  allow_stopping_for_update = true
  tags = ["buildid", "terraform123"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
    network_interface {
    network = "default"

    access_config {
      // Ephemeral
    }
  }
}