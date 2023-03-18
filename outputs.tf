output "load-balancer-id"  {
 value = aws_elb.exo-lb.id
}

output "load-balancer-dns-name"  {
 value = aws_elb.exo-lb.dns_name
}
