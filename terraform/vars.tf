variable "common_tags" {
  type = map(any)
  default = {
    ENV           = "lab"
    LAB_ID        = "Rustdesk"
    ALIAS_PROJECT = "Rustdesk in Cloud"
    MANAGED_BY    = "Terraform"
  }
}