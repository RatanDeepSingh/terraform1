variable "vm_name" {
    type = string
    description = "this is the name for the virtual machine"  
}

variable "admin_username" {
  type = string
  description = "Admin user name"
}

variable "vm_size" {
  type = string
  description = "This is vm size"
  default = "Standard_B2s"
}


variable "admin_password" {
  type = string
  description="Passsword"
    default = "MSAzure@12345"
}

variable "test_var" {
    type = string
    description = "this is a test variable"  
}
