locals {
  repository_name = var.is_base_image ? "base-${var.product_family}-${var.image_name}" : "${var.program}-${var.app}-${var.image_name}"
}