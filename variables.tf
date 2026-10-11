variable "iap_web_region_backend_service_iam_members" {
  description = <<EOT
Map of iap_web_region_backend_service_iam_members, attributes below
Required:
    - member
    - role
    - web_region_backend_service
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member                     = string
    role                       = string
    web_region_backend_service = string
    project                    = optional(string)
    region                     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

