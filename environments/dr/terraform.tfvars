prefix                  = "dr-f5-xc"      # Prefix for all objects in the project
description             = "Managed by ADO"  # description of all XC resources
instance_type           = "Standard_D4s_v4" # SMALL: Standard_D4s_v4	MEDIUM: Standard_D8s_v4	LARGE: Standard_D16s_v4
location                = "East US"         # Azure location
existing_resource_group = ""                # Azure resource group with VNET
sli_subnet              = ""                # IDs of the Inside subnet
slo_subnet              = ""                # IDs of the Outside subnet

# XC provider vars
f5xc_api_p12_file = "../../global/p12.p12" # location of XC .p12 file
f5xc_api_url      = ""                     # XC tenant e.g. "https://f5-consult.console.ves.volterra.io/api"
