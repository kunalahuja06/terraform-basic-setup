# create api gateway
resource "aws_api_gateway_rest_api" "test-api" {
  name        = "test-api"
  description = "This is my API for demonstration purposes"
}

# define a resource for the api gateeway
resource "aws_api_gateway_resource" "base-resource" {
  rest_api_id = aws_api_gateway_rest_api.test-api.id
  parent_id   = aws_api_gateway_rest_api.test-api.root_resource_id
  path_part   = "{proxy+}"
}

# define a method for the resource
resource "aws_api_gateway_method" "test-api-method" {
  rest_api_id   = aws_api_gateway_rest_api.test-api.id
  resource_id   = aws_api_gateway_resource.base-resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

# define an integration for the method
resource "aws_api_gateway_integration" "test-api-integration" {
  rest_api_id = aws_api_gateway_rest_api.test-api.id
  resource_id = aws_api_gateway_resource.base-resource.id
  http_method = aws_api_gateway_method.test-api-method.http_method

  integration_http_method = "ANY"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.test-lambda.invoke_arn
  passthrough_behavior    = "WHEN_NO_MATCH"
}

# create a deployment for the api gateway
resource "aws_api_gateway_deployment" "test-api-deployment" {
  depends_on  = [aws_api_gateway_integration.test-api-integration]
  rest_api_id = aws_api_gateway_rest_api.test-api.id
  stage_name  = "v1"
}
