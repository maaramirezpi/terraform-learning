terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 4.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

resource "aws_iam_user" "a-user" {
  tags = {
    Description = "Technical TEam Leader" # Tag the instance with a Name tag for easier identification
  }
  name = "lucy"
}

resource "aws_iam_user_policy_attachment" "lucy-user-attachment" {
  policy_arn = aws_iam_policy.example.arn
  user = aws_iam_user.a-user.name
}
resource "aws_iam_policy" "example" {
  name = "example"
  path   = "/"
  policy = data.aws_iam_policy_document.example.json
}

data "aws_iam_policy_document" "example" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}


resource "aws_s3_bucket" "finance" {
  bucket = "maaramirezpi-finance"
  tags = {
    Description = "finance and payroll"
  }
}

resource "aws_s3_bucket_object" "finance-2020" {
  bucket = aws_s3_bucket.finance.id
  key    = "mypet.txt"
  content = "../local-file/mypet.txt"
}