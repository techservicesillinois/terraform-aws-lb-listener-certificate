output "aws_lb_listener_arn" {
  value = length(var.lb_ports) > 0 ? data.aws_lb_listener.selected[0].arn : null
}
