resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.env}acr00012"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.env}-aks"
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.env}-aks"

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count  #Client specific
    vm_size             = "Standard_DS2_v2"  #Client specific
    type                = "VirtualMachineScaleSets"
    availability_zones  = [1, 2, 3] #Client specific
    enable_auto_scaling = false
    vnet_subnet_id      = var.node_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure" # CNI
    network_policy    = "azure"
  }
}
//resource "helm_release" "nginx-ingress-controller" {
//  name             = "nginx-ingress"
//  namespace        = "nginx-ingress"
//  create_namespace = true
//  repository       = "https://charts.bitnami.com/bitnami"
//  chart            = "nginx-ingress-controller"
//
//  set {
//    name  = "controller.replicaCount"
//    value = "2"
//  }
//
//  set {
//    name  = "controller.nodeSelector.kubernetes\\.io/os"
//    value = "linux"
//  }
//
//  set {
//    name  = "defaultBackend.nodeSelector.kubernetes\\.io/os"
//    value = "linux"
//  }
//}