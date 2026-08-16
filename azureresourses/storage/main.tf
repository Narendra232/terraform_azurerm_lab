resource "azurerm_storage_account" "storage" {
  for_each = var.stg

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier              = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  min_tls_version               = "TLS1_2"
  public_network_access_enabled = false
  allow_nested_items_to_be_public = false
  shared_access_key_enabled     = false

  blob_properties {
    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  sas_policy {
    expiration_period = "00.01:00:00"
    expiration_action = "Log"
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }

}