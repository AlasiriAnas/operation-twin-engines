module "network" {
  source = "./modules/network"
  region = var.region
}

module "backend_vm" {
  source = "./modules/compute"

  name           = "backend-vm"
  zone           = var.zone
  subnet         = module.network.backend_subnet
  startup_script = file("scripts/backend.sh")

  tags = ["backend"]
}

module "frontend_vm" {
  source = "./modules/compute"

  name           = "frontend-vm"
  zone           = var.zone
  subnet         = module.network.frontend_subnet

  #Inject backend IP dynamically
  startup_script = templatefile("scripts/frontend.sh", {
    backend_ip = module.backend_vm.internal_ip
  })

  tags = ["frontend"]
}