resource "aws_iam_role" "glue_job" {
  path               = "/"
  name               = "${var.prefix}-${var.environment}-crawler-job-role"
  description        = "Aws Glue Crawler S3 Full Access & CloudWatch"
  assume_role_policy = file("./permissions/Role_GlueJobs.json")
}

resource "aws_iam_policy" "glue_job" {
  path        = "/"
  name        = "${var.prefix}-${var.environment}-crawler-job-role"
  description = "Aws Glue Crawler S3 Full Access & CloudWatch"
  policy      = file("./permissions/Policy_GlueJobs.json")
}

resource "aws_iam_role_policy_attachment" "glue_job" {
  role       = aws_iam_role.glue_job.name
  policy_arn = aws_iam_policy.glue_job.arn
}