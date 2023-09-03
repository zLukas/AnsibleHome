resource "google_service_account" "server" {
  account_id   = var.service_account.id
  display_name = var.service_account.display_name
}

resource "google_service_account_key" "server_access" {
  service_account_id = google_service_account.server.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}