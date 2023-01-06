resource "google_storage_bucket" "storage_bucket" {
  project                     = var.project_id
  name                        = "${var.project_id}-${var.app_code}-validator-${var.env}"
  location                    = var.region
  force_destroy               = var.bucket_config.force_destroy
  storage_class               = var.bucket_config.storage_class
  uniform_bucket_level_access = var.bucket_config.uniform_bucket_level_access
  # labels = {
  #   environment = var.label
  #   team        = "delivery"
  # }
}
