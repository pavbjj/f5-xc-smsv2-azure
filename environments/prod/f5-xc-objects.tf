# Create SMSv2 objects
resource "volterra_securemesh_site_v2" "node-1" {
  name        = "${var.prefix}-smsv2-node-1"
  namespace   = "system"
  description = var.description
  labels = {
    "ves.io/provider" = "ves-io-AZURE",
    "vsite"           = "${var.prefix}-azure-site"
  }
  block_all_services      = true
  logs_streaming_disabled = true
  enable_ha               = false
  lifecycle {
    ignore_changes = [labels]
  }
  re_select {
    geo_proximity = true
  }
  azure {
    not_managed {
    }
  }
}

resource "volterra_securemesh_site_v2" "node-2" {
  name        = "${var.prefix}-smsv2-node-2"
  namespace   = "system"
  description = var.description
  labels = {
    "ves.io/provider" = "ves-io-AZURE",
    "vsite"           = "${var.prefix}-azure-site"
  }
  block_all_services      = true
  logs_streaming_disabled = true
  enable_ha               = false
  lifecycle {
    ignore_changes = [labels]
  }
  re_select {
    geo_proximity = true
  }
  azure {
    not_managed {
    }
  }
}

resource "volterra_securemesh_site_v2" "node-3" {
  name        = "${var.prefix}-smsv2-node-3"
  namespace   = "system"
  description = var.description
  labels = {
    "ves.io/provider" = "ves-io-AZURE",
    "vsite"           = "${var.prefix}-azure-site"
  }
  block_all_services      = true
  logs_streaming_disabled = true
  enable_ha               = false
  lifecycle {
    ignore_changes = [labels]
  }
  re_select {
    geo_proximity = true
  }
  azure {
    not_managed {
    }
  }
}

# Create SMSv2 tokens
resource "volterra_token" "node-1" {
  name        = "${var.prefix}-token-node-1"
  namespace   = "system"
  description = var.description
  type        = 1
  site_name   = volterra_securemesh_site_v2.node-1.name
  depends_on  = [volterra_securemesh_site_v2.node-1]
}

resource "volterra_token" "node-2" {
  name        = "${var.prefix}-token-node-2"
  namespace   = "system"
  description = var.description
  type        = 1
  site_name   = volterra_securemesh_site_v2.node-2.name
  depends_on  = [volterra_securemesh_site_v2.node-2]
}

resource "volterra_token" "node-3" {
  name        = "${var.prefix}-token-node-3"
  namespace   = "system"
  description = var.description
  type        = 1
  site_name   = volterra_securemesh_site_v2.node-3.name
  depends_on  = [volterra_securemesh_site_v2.node-3]
}

# Create Virtual Site
resource "volterra_virtual_site" "vs-name" {
  name        = "${var.prefix}-vsite"
  namespace   = "shared"
  description = var.description
  site_type   = "CUSTOMER_EDGE"
  site_selector {
    expressions = ["vsite in (${var.prefix}-azure-site)"]
  }
}
