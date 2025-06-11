# Create XC nodes
## NODE 1
resource "azurerm_network_interface" "slo-nic-node-1" {
  name                = "${var.prefix}-slo-node-1-nic"
  location            = var.location
  resource_group_name = var.existing_resource_group

  ip_configuration {
    name                          = "${var.prefix}-slo-node-1-ip"
    subnet_id                     = var.slo_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "sli-nic-node-1" {
  name                = "${var.prefix}-sli-node-1-nic"
  location            = var.location
  resource_group_name = var.existing_resource_group

  ip_configuration {
    name                          = "${var.prefix}-sli-node-1-ip"
    subnet_id                     = var.sli_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-node-1" {
  name                = "${var.prefix}-node-1"
  location            = var.location
  resource_group_name = var.existing_resource_group
  size                = var.instance_type
  admin_username      = "cloud-user"
  zone                = 1
  network_interface_ids = [
    azurerm_network_interface.slo-nic-node-1.id,
    azurerm_network_interface.sli-nic-node-1.id
  ]

  admin_ssh_key {
    username   = "cloud-user"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  custom_data = base64encode(<<EOF
#cloud-config
write_files:
  - path: /etc/vpm/user_data
    permissions: 644
    owner: root
    content: |
      token: ${trimprefix(trimprefix(volterra_token.node-1.id, "id="), "\"")}
EOF
  )

  source_image_reference {
    publisher = "f5-networks"
    offer     = "f5xc_customer_edge"
    sku       = "f5xccebyol"
    version   = "latest"
  }

  plan {
    publisher = "f5-networks"
    product   = "f5xc_customer_edge"
    name      = "f5xccebyol"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "node-1-disk-f5xc"
    disk_size_gb         = 80
  }

  disable_password_authentication = true
  depends_on = [
    volterra_token.node-1,
  volterra_securemesh_site_v2.node-1]
}
## NODE 2
resource "azurerm_public_ip" "pip-node-2" {
  name                = "${var.prefix}-node-2-pip"
  location            = var.location
  resource_group_name = var.existing_resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "slo-nic-node-2" {
  name                = "${var.prefix}-slo-node-2-nic"
  location            = var.location
  resource_group_name = var.existing_resource_group

  ip_configuration {
    name                          = "${var.prefix}-slo-node-2-ip"
    subnet_id                     = var.slo_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "sli-nic-node-2" {
  name                = "${var.prefix}-sli-node-2-nic"
  location            = var.location
  resource_group_name = var.existing_resource_group

  ip_configuration {
    name                          = "${var.prefix}-sli-node-2-ip"
    subnet_id                     = var.sli_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-node-2" {
  name                = "${var.prefix}-node-2"
  location            = var.location
  resource_group_name = var.existing_resource_group
  size                = var.instance_type
  admin_username      = "cloud-user"
  zone                = 2
  network_interface_ids = [
    azurerm_network_interface.slo-nic-node-2.id,
    azurerm_network_interface.sli-nic-node-2.id
  ]

  admin_ssh_key {
    username   = "cloud-user"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  custom_data = base64encode(<<EOF
#cloud-config
write_files:
  - path: /etc/vpm/user_data
    permissions: 644
    owner: root
    content: |
      token: ${trimprefix(trimprefix(volterra_token.node-2.id, "id="), "\"")}
EOF
  )

  source_image_reference {
    publisher = "f5-networks"
    offer     = "f5xc_customer_edge"
    sku       = "f5xccebyol"
    version   = "latest"
  }

  plan {
    publisher = "f5-networks"
    product   = "f5xc_customer_edge"
    name      = "f5xccebyol"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "node-2-disk-f5xc"
    disk_size_gb         = 80
  }

  disable_password_authentication = true
  depends_on = [
    volterra_token.node-2,
  volterra_securemesh_site_v2.node-2]
}

## NODE 3
resource "azurerm_public_ip" "pip-node-3" {
  name                = "${var.prefix}-node-3-pip"
  location            = var.location
  resource_group_name = var.existing_resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "slo-nic-node-3" {
  name                = "${var.prefix}-slo-node-3-nic"
  location            = var.location
  resource_group_name = var.existing_resource_group

  ip_configuration {
    name                          = "${var.prefix}-slo-node-3-ip"
    subnet_id                     = var.slo_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "sli-nic-node-3" {
  name                = "${var.prefix}-sli-node-3-nic"
  location            = var.location
  resource_group_name = var.existing_resource_group

  ip_configuration {
    name                          = "${var.prefix}-sli-node-3-ip"
    subnet_id                     = var.sli_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-node-3" {
  name                = "${var.prefix}-node-3"
  location            = var.location
  resource_group_name = var.existing_resource_group
  size                = var.instance_type
  admin_username      = "cloud-user"
  zone                = 3
  network_interface_ids = [
    azurerm_network_interface.slo-nic-node-3.id,
    azurerm_network_interface.sli-nic-node-3.id
  ]

  admin_ssh_key {
    username   = "cloud-user"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  custom_data = base64encode(<<EOF
#cloud-config
write_files:
  - path: /etc/vpm/user_data
    permissions: 644
    owner: root
    content: |
      token: ${trimprefix(trimprefix(volterra_token.node-3.id, "id="), "\"")}
EOF
  )

  source_image_reference {
    publisher = "f5-networks"
    offer     = "f5xc_customer_edge"
    sku       = "f5xccebyol"
    version   = "latest"
  }

  plan {
    publisher = "f5-networks"
    product   = "f5xc_customer_edge"
    name      = "f5xccebyol"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "node-3-disk-f5xc"
    disk_size_gb         = 80
  }

  disable_password_authentication = true
  depends_on = [
    volterra_token.node-3,
  volterra_securemesh_site_v2.node-3]
}

# Network Load Balancer
## Internal Load Balancer
resource "azurerm_lb" "internal_nlb" {
  name                = "${var.prefix}-nlb-internal"
  location            = var.location
  resource_group_name = var.existing_resource_group
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "InternalFE"
    subnet_id                     = var.slo_subnet
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [
    azurerm_linux_virtual_machine.vm-node-1,
    azurerm_linux_virtual_machine.vm-node-2,
    azurerm_linux_virtual_machine.vm-node-3
  ]
}

## Backend address pool
resource "azurerm_lb_backend_address_pool" "pool" {
  name            = "${var.prefix}-nlb-pool"
  loadbalancer_id = azurerm_lb.internal_nlb.id
}

## Health probe (it requires a live XC Load Balancer advertised to this site so health check works)
resource "azurerm_lb_probe" "health_80" {
  name                = "health-80"
  loadbalancer_id     = azurerm_lb.internal_nlb.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 15
  number_of_probes    = 1
}

## LB rule to forward CE nodes
resource "azurerm_lb_rule" "lb_rule" {
  name                           = "wildcard"
  loadbalancer_id                = azurerm_lb.internal_nlb.id
  protocol                       = "All"
  frontend_port                  = 0
  backend_port                   = 0
  frontend_ip_configuration_name = "InternalFE"
  probe_id                       = azurerm_lb_probe.health_80.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool.id]
}

## Associate each SLO NIC to the backend pool
resource "azurerm_network_interface_backend_address_pool_association" "node1" {
  network_interface_id    = azurerm_network_interface.slo-nic-node-1.id
  ip_configuration_name   = "${var.prefix}-slo-node-1-ip"
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "node2" {
  network_interface_id    = azurerm_network_interface.slo-nic-node-2.id
  ip_configuration_name   = "${var.prefix}-slo-node-2-ip"
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "node3" {
  network_interface_id    = azurerm_network_interface.slo-nic-node-3.id
  ip_configuration_name   = "${var.prefix}-slo-node-3-ip"
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
}
