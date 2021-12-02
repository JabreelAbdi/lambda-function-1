resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "assumerolelambda"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = var.lambda_role_name
  }
}

resource "aws_iam_policy" "function-1-policy" {
  name        = "function-1-policy"
  path        = "/"
  description = "My Policy to allow my lambda function to put logs into cloudwatch"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Sid" : "s3List",
        "Action" : [
          "s3:List*"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Sid" : "Stmt1638286085165",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject"
        ],

        "Effect" : "Allow",
        "Resource" : [
          "arn:aws:s3:::lamba_s3_bucket",
          "arn:aws:s3:::lamba_s3_bucket/*"
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "cloudwatch-lambda" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.function-1-policy.arn
}