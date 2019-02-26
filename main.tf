# Look up certificate by name.

data "aws_acm_certificate" "selected" {
  domain      = "${var.fqdn}"
  most_recent = true
}

# Look up load balancer by name.

data "aws_lb" "selected" {
  name = "${var.lb_name}"
}

# Look up LB listener on specified load balancer and port.

data "aws_lb_listener" "selected" {
  count             = "${length(var.lb_ports)}"

  load_balancer_arn = "${data.aws_lb.selected.arn}"
  port              = "${var.lb_ports[count.index]}"
}

# Attach ACM certificate.

resource "aws_lb_listener_certificate" "default" {
  count           = "${length(var.lb_ports)}"

  certificate_arn = "${data.aws_acm_certificate.selected.arn}"
  listener_arn    = "${element(data.aws_lb_listener.selected.*.arn, count.index)}"
}
