resource "aws_route53_zone" "clouds-dial" {
  name = "cloudsdialTerra.com"
}
resource "aws_route53_record" "cd_instance-record" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "${var.bravo}"
  type    = "A"
  ttl     = "300"
  records = [var.aws_instance[0]]
}