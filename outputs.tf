output "load-balancer-id"  {
 value = aws_elb.load-balancer.id
}

output "load-balancer-dns-name"  {
 value = aws_elb.load-balancer.dns_name
}
