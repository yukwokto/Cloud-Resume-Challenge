#lambda role
resource "aws_iam_role" "lambdaRole" {
  name = "lambdaRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

#policy doucment for lambda
data "aws_iam_policy_document" "lambda_execution_docs" {
    statement {
      sid       = ""
      effect    = "Allow"
      resources = ["arn:aws:logs:*:*:*"]

      actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
      ]
    }

    statement {
      sid = ""
      effect = "Allow"
      resources = [aws_dynamodb_table.counter-db.arn]

      actions = [         
        "dynamodb:BatchGetItem",
        "dynamodb:GetItem",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:BatchWriteItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem" 
      ]
    }
}

#attach policy document to a policy
resource "aws_iam_policy" "lambda_policy" {
  name = "lambda_policy"
  description = "Lambda policy for logging and accessing dynamoDB"
  policy = data.aws_iam_policy_document.lambda_execution_docs.json
}

#attach policy to the lambda role
resource "aws_iam_policy_attachment" "attach-policy-to-lambda" {
  name = "attachment"
  roles = [aws_iam_role.lambdaRole.name]
  policy_arn = aws_iam_policy.lambda_policy.arn
}
