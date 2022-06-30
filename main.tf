module "rgroup" {
    source = "./modules/rgroup"
    location = "canadacentral"
    rg_name = "hamid6388-assignment1-rg"
    tags = local.common_tags
}
module "loadbalancer" {
    source = "./modules/loadbalancer"
    lb_name = "hamid6388-assignment1-lb"
    public_ip_lb_name = "hamid6388-assignment1-publicip-lb"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    
    linux_nic   = module.vmlinux.linux_nic
    windows_nic = module.vmwindows.Windows_vm_nic
    
    tags = local.common_tags
    depends_on = [
        module.vmlinux,
        module.vmwindows
    ]
    
}

module "network" {
    source = "./modules/network"
    rg_name = module.rgroup.rg_name
    location = module.rgroup.location_name
    vnet_name = "hamid6388-Assignment1-vnet"
    vnet_add_space= ["10.0.0.0/16"]
    subnet_name = "hamid6388-Assignment1-subnet"
    subnet_add_space = ["10.0.1.0/24"]
    nsg_name = "hamid6388-Assignment1-nsg"
    tags = local.common_tags
    depends_on =[
      module.rgroup
    ]
}


module "common" {
    source = "./modules/common"
    recovery_service_vault_name = "hamid6388-assignment1-vault"
    log_analytics_workspace_name = "hamid6388-assignmnent1-loganalytics-workspace"
    storage_account_name = "hamid6388assign1stoac"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    depends_on = [
        module.rgroup,
]
    
}

module "vmlinux" {
    source = "./modules/vmlinux"

    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name

    linux_availability_set = "linux_avs"
    #linux_name     = "hamid6388-u-vm"

    linux_name = {
    "hamid6388-linux1" = "Standard_B1s"
    "hamid6388-linux2" = "Standard_B1s"
  }

    nb_count       = 2
    subnet_id = module.network.subnet_id
    storage_account_uri = module.common.storage_account_uri
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network,
    ]
}

module "vmwindows" {
    source = "./modules/vmwindows"
    windows_name = "hamid6388-winvm"
    windows_availability_set = "windows_avs"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    subnet_id = module.network.subnet_id
    storage_account_uri = module.common.storage_account_uri
    tags = local.common_tags
    depends_on =[
      module.rgroup,
      module.network
    ]
}

module "datadisk" {
    source = "./modules/datadisk"
    location = module.rgroup.location_name
    rg_name = "hamid6388-assignment1-rg"
    linux_name = module.vmlinux.linux_vm_hostname
    linux_id   = module.vmlinux.linux_vm_id
   
    win_datadisk_name = "hamid6388-assignment1-datadisk-win"

    windows_id = module.vmwindows.Windows_VM_Id
    tags = local.common_tags
    depends_on =[
      module.vmwindows,
      module.vmlinux
    ]
}



module "database" {
    source = "./modules/database"
    db_server_name = "hamid6388-assignment1-postgre-server"
    db_name = "hamid6388-assignment1-postgre_server-db"
    location = module.rgroup.location_name
    rg_name = module.rgroup.rg_name
    tags = local.common_tags
    depends_on = [
        module.loadbalancer
    ]
    
}