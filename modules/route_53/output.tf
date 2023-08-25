output "domain_name" {
    value = aws_route53_zone.domain_site.fqdn
}