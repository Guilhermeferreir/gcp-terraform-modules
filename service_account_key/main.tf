data "google_service_account" "service_account" {
  account_id = var.service_account_id
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = var.service_account_id
}

module "service_account_key_secret" {
  source    = "../secret_manager_secret"
  secret_id = "${data.google_service_account.service_account.display_name}-key"
}

module "service_account_key_secret_version" {
  source      = "../secret_manager_secret_version"
  secret      = module.service_account_key_secret.secret_id
  secret_data = base64decode(google_service_account_key.service_account_key.private_key)
}