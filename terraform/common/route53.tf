data "aws_route53_zone" "selected" {
  name         = "trade-tariff.service.gov.uk."
  private_zone = false
}

#Dev
resource "aws_route53_record" "dev" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "dev.trade-tariff.service.gov.uk"
  type    = "CNAME"
  ttl     = "300"
  records = ["dhoxd37612giy.cloudfront.net."]
}

resource "aws_route53_record" "assets-dev" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "assets-dev.trade-tariff.service.gov.uk"
  type    = "CNAME"
  ttl     = "300"
  records = ["dhoxd37612giy.cloudfront.net."]
}

#Staging
resource "aws_route53_record" "staging" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "staging.trade-tariff.service.gov.uk"
  type    = "CNAME"
  ttl     = "300"
  records = ["dzqkc5f1129m8.cloudfront.net."]
}

resource "aws_route53_record" "assets-staging" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "assets-staging.trade-tariff.service.gov.uk"
  type    = "CNAME"
  ttl     = "300"
  records = ["dzqkc5f1129m8.cloudfront.net."]
}

#production
resource "aws_route53_record" "production" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "www.trade-tariff.service.gov.uk"
  type    = "CNAME"
  ttl     = "300"
  records = ["d4hk31uaigri7.cloudfront.net."]
}

resource "aws_route53_record" "production-assets" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "assets.trade-tariff.service.gov.uk"
  type    = "CNAME"
  ttl     = "300"
  records = ["d4hk31uaigri7.cloudfront.net."]
}
