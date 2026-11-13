# Company network
resource "aws_vpc" "corp" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "ironbark-vpc" }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.corp.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "ap-southeast-2a"
  tags = { Name = "ironbark-private-a" }
}

# Where engineers store aircraft design files
resource "aws_s3_bucket" "design_files" {
  bucket_prefix = "ironbark-design-files-"
  force_destroy = true
}

# Staff accounts
resource "aws_iam_user" "staff" {
  for_each = toset(["alice.engineer", "ben.finance", "chris.itadmin"])
  name     = each.key
}

# DELIBERATE WEAKNESS: IT admin has full admin rights. We fix this in Ticket 4.
resource "aws_iam_user_policy_attachment" "chris_admin" {
  user       = aws_iam_user.staff["chris.itadmin"].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "design_bucket" {
  value = aws_s3_bucket.design_files.bucket
}
