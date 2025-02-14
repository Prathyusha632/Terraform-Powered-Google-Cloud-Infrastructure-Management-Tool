resource "google_compute_instance_template" "default" {
  name_prefix = var.instance_template_name
  machine_type = var.machine_type
  project      = var.project_id

  disk {
    boot  = true
    auto_delete = true
    source_image = var.disk_image
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {

    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  metadata = {
    google-logging-enabled = "true"
    google-monitoring-enabled = "true"
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
  }
}

resource "google_compute_region_instance_group_manager" "default" {
  name                = "${var.instance_template_name}-mig"
  base_instance_name  = "${var.instance_template_name}-instance"
  region              = var.region
  project             = var.project_id
  version {
    instance_template = google_compute_instance_template.default.id
  }
  target_size = var.min_replicas
}

resource "google_compute_region_autoscaler" "default" {
  name   = "${var.instance_template_name}-autoscaler"
  region = var.region
  project = var.project_id

  target = google_compute_region_instance_group_manager.default.id

  autoscaling_policy {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    cpu_utilization {
      target = var.target_cpu_utilization
    }
  }
}
