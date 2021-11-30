resource "aws_iam_role" "iam-for-lambda" {
  name = "iam-for-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "function-1-policy" {
  name        = "function-1-policy"
  path        = "/"
  description = "My function 1 policy"
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
        "Sid" : "Stmt1638286085165",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect" : "Allow",
        "Resource" : "arn:aws:s3:::lamba_s3_bucket"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "cloudwatch-lambda" {
  role       = aws_iam_role.iam-for-lambda.name
  policy_arn = aws_iam_policy.function-1-policy.arn
}