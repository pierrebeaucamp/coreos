variable "do_token" {}                                                   

variable "count" {
    default = 3
}

variable "discovery" {
    default = "discovery.txt"
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
        "1" = "nyc3"
        "2" = "nyc3"
    }                                                                    
}

