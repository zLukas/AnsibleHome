variable "project_id" {
    type  = string
}

variable "region" {
    type = string 
    default = "europe-central2"
}

variable "service_account" {
    type = object({
      id = string
      display_name = string
      description = string 
    })

}