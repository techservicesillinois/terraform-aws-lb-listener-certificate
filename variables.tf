variable "fqdn" {
  description = "Fully-qualified domain name of the ACM certificate"
}

variable "lb_name" {
  description = "Load balancer name"
}

variable "lb_ports" {
  description = "List of load balancer ports"
  type        = "list"
}
