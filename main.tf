resource "google_iap_web_region_backend_service_iam_member" "iap_web_region_backend_service_iam_members" {
  for_each = var.iap_web_region_backend_service_iam_members

  member                     = each.value.member
  role                       = each.value.role
  web_region_backend_service = each.value.web_region_backend_service
  project                    = each.value.project
  region                     = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

