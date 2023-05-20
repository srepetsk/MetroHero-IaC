resource "aws_s3_bucket" "this" {
  bucket = "${var.appurl}"
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

	redirect_all_requests_to {
		host_name = "${var.redirect_to}"
		protocol = "https"
	}
}

terraform {
	backend "s3" {
		bucket = "metrohero-terraform-state"
		key    = "state"
		region = "us-east-1"
	}
}
