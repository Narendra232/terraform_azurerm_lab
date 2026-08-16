resource "azurerm_storage_account" "storage" {
  for_each = var.stg

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  # CKV_AZURE_44 - Enforce TLS 1.2
  min_tls_version = "TLS1_2"

  # CKV_AZURE_59 - Disable public network access entirely
  public_network_access_enabled = false

  # CKV_AZURE_190 / CKV2_AZURE_47 - Disable public blob access
  allow_nested_items_to_be_public = false

  # CKV2_AZURE_40 - Disable shared key authorization (use AAD instead)
  shared_access_key_enabled = false

  # CKV2_AZURE_38 - Soft delete for blobs and containers
  blob_properties {
    # CKV2_AZURE_21 - Enable blob read/write/delete logging
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 7
    }

    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  # CKV_AZURE_33 - Enable Queue service logging
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 7
    }
  }

  # CKV2_AZURE_41 - SAS expiration policy
  sas_policy {
    expiration_period = "00.01:00:00"
    expiration_action = "Log"
  }

  # CKV2_AZURE_33 - Network default deny (private endpoint must be added separately)
  # checkov:skip=CKV2_AZURE_33: Private endpoint requires additional infrastructure (Private DNS Zone, VNet) managed separately
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }

  # checkov:skip=CKV2_AZURE_1: Customer Managed Key requires Azure Key Vault, managed separately for this lab environment

}