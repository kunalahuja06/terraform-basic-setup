resource "aws_s3_bucket" "test-bucket" {
  bucket = "test-bucket"
  tags = {
    Name = "test-bucket"
  }
}

resource "aws_s3_object" "test-object" {
  bucket = aws_s3_bucket.test-bucket.id
  key    = "test-object"
  source = "<File location>"
  tags = {
    Name = "test-object"
  }
}
