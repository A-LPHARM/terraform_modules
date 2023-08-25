# get hosted zone details
data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name   #this is the domain name and a variable was created so as not to make it completely open
}

# create a record set in route 53
resource "aws_route53_record" "domain_site" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = var.subdomain
  type    = "A"
  ttl     =  300

  alias {
    name                   =  aws_lb.application_loadbalancer.dns_name
    zone_id                =  aws_lb.application_loadbalancer.zone_id
    evaluate_target_health =  true
  }
}