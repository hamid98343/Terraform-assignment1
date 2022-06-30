output "rgroup" {value = module.rgroup.rg_name }

output "location" {
  value = module.rgroup.location_name
}
#--------------------------------------------network 
output "Vnet_name" {
  value = module.network.Vnet_name
}
output "vnet_address_space" {
  value = module.network.vnet_address_space
}

output "subnet_name" {
  value = module.network.subnet_name
}


output "subnet_add_space" {
   value = module.network.subnet_add_space
}

# --------------------Database ---------------------------------

output "Database_Server_Name" {
  value = module.database.db_server_name
}

output "Database_Name" {
  value = module.database.db_name
}

#----------------------loadbalancer

output "Loadbalancer_name" {
  value = module.loadbalancer.load_balancer_name
}

# --------------------------------common------------------

output "recovery_vault_name" {
  value = module.common.recovery_vault_name
}

output "log_analytics_workspace" {
  value = module.common.log_analytics_workspace_name
}

output "storage_account_name" {
value = module.common.storage_account_name
}

#linux-----------------------------------------

output "linux_vm_hostname" {
  value = module.vmlinux.linux_vm_hostname
}

output "linux_Private_IP" {
  value = module.vmlinux.linux_Private_IP
}

output "linux_Public_IP" {
  value = module.vmlinux.linux_Public_IP
}

#-----------------------------------------windows output
output "windows_VM_Hostname" {
  value = module.vmwindows.windows_VM_Hostname
}

output "windows_Private_IP" {
  value = module.vmwindows.windows_Private_IP

}

output "windows_Public_IP" {
  value = module.vmwindows.windows_Public_IP

}

