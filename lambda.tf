
resource "aws_lambda_function" "test-lambda" {
  function_name = "test-lambda"                                                                          # name of the lambda function
  filename      = "<your lambda zip file>" # name of the lambda function
  role          = "<Lambda role>"                                           # role of the lambda function
  description   = "My lambda function"                                                                   # description of the lambda function                                                            # s3 key to store the lambda function code
  handler       = "<Lambda handler>"                # entry point to the lambda function
  runtime       = "<lambda runtime environment>"                                                                              # stack used by the lambda function
  memory_size   = 512                                                                                    # memory size of the lambda function, defaults to 128
  timeout       = 15                                                                                     # timeout of the lambda function, defaults to 3
  tags = {
    Name = "my-lambda1"
  }
  publish = true
}

resource "aws_lambda_alias" "my_lambda_alias" {
  name             = "BLUE"
  function_name    = aws_lambda_function.test-lambda.function_name
  function_version = "1"
}

resource "aws_lambda_provisioned_concurrency_config" "test-concurrency" {
  function_name                     = aws_lambda_function.test-lambda.function_name
  qualifier                         = aws_lambda_function.test-lambda.version
  provisioned_concurrent_executions = 5
}

