variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "env" {
  type        = string
  description = "One of (dev, qa, test, prod)"
  # validation {
  #   condition     = contains(["dev", "qa", "test", "prod"], var.env)
  #   error_message = "Unexpected environment value."
  # }
}

variable "label" {
  description = "The label to identify resources of this pattern."
  type        = string
}
variable "app_code" {
  description = "The app_name  to identify the application/project using this pattern."
  type        = string
}

variable "region" {
  type = string
  # validation {
  #   condition     = contains(["us-east4", "europe-west3"], var.region)
  #   error_message = "Region must either be us-east4 or europe-west3."
  # }
}

#### for standard landing bucket
variable "bucket_config" {
  type = object({
    storage_class               = string
    force_destroy               = bool
    uniform_bucket_level_access = bool
  })
  default = {
    storage_class               = "STANDARD"
    force_destroy               = true
    uniform_bucket_level_access = true
  }
  # validation {
  #   condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.bucket_config.storage_class)
  #   error_message = "The storage class set for an object affects the object's availability and pricing model. Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  # }
}
