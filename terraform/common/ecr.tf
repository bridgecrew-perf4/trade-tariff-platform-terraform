resource "aws_ecr_repository" "docker" {
  count = length(var.docker_repositories)
  name                 = "tariff-${element(var.docker_repositories,count.index)}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
