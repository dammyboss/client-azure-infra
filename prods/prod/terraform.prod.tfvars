env                 = "prod"
location            = "eastus"
prefix              = "test"
adminname           = "proddbuser"
adminpwd            = "Foundation1$"
vmsize              = "Standard_D2s_v3"
scriptping          = "https://aznetworkinghandson.blob.core.windows.net/public/enable-icmp.ps1"
scriptiis           = "https://safocaapp.blob.core.windows.net/public/deploy-iis.ps1"
frontdoorname       = "poc-test-frontdoor"
secret_name         = "DatabasePwd"
secret_value        = "@Aa1234564789!"
frontdoorlocation   = "Global"
kubernetes_version  = "1.19.11"
system_node_count   = 3
//client_secret       = ""