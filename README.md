# listener-certificate

[![Terraform actions status](https://github.com/techservicesillinois/terraform-aws-lb-listener-certificate/workflows/terraform/badge.svg)](https://github.com/techservicesillinois/terraform-aws-lb-listener-certificate/actions)

Provides a Load Balancer Listener Certificate resource.
This resource adds an ACM certificate to the load balancer for the specified
listeners. It does *not* replace the default certificate on the LB.

Example Usage
-----------------

```hcl
module "foo" {
  source = "git@github.com:techservicesillinois/terraform-aws-lb-listener-certificate"

  fqdn     = "foo.example.com"
  lb_name  = "public"
  lb_ports = [ 443 ]
}
```

Argument Reference
-----------------

The following arguments are supported:

* `fqdn` - (Required) Fully-qualified domain name of the ACM certificate.

* `lb_name` - (Required) Load balancer name.

* `lb_ports` - (Required) List of load balancer ports.


Attributes Reference
--------------------

* `aws_lb_listener_arn` – ARN of the listener.
