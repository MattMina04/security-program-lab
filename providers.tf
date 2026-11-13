terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-2"
  profile = "agent-toolkit"

  default_tags {
    tags = {
      Project = "security-program-lab"
      Company = "Ironbark Aerosystems (fictional)"
    }
  }
}
