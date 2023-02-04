resource "aws_lambda_function" "counter-function" {
  filename = "${path.module}/python/lambda_function.zip"
  function_name = "counter-function"
  role = aws_iam_role.lambdaRole.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"
  depends_on = [
    aws_iam_policy_attachment.attach-policy-to-lambda
  ]
}
