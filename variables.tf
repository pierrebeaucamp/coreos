# Needs to be set as an argument
variable "do_token" {}

variable "ca" {
    default = "ca.crt"
}

variable "count" {
    default = 3
}

variable "crt" {
    default = {
        "0" = "finn.crt"
        "1" = "jake.crt"
        "2" = "bmo.crt"
    }
}

variable "discovery" {
    default = "discovery.txt"
}

variable "key" {
    default = {
        "0" = "finn.key"
        "1" = "jake.key"
        "2" = "bmo.key"
    }
}

variable "name" {
    default = {
        "0" = "finn"
        "1" = "jake"
        "2" = "bmo"
    }
}

variable "region" {
    default = {
        "0" = "fra1"
        "1" = "tor1"
        "2" = "sgp1"
    }
}

