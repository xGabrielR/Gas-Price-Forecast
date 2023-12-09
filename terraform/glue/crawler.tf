resource "aws_glue_connection" "delta_connection" {
  name = "delta_connection"
  connection_type = "NETWORK"

    physical_connection_requirements {
      availability_zone      = "us-east-1a"
      security_group_id_list = ["1", "2", "3"] # Default SGs Or created with TF
      subnet_id              = "aaa"           # Default or Created Subnet with TF
    }
}

resource "aws_glue_crawler" "crawler" {
  database_name = "${var.prefix}-${var.environment}-database"
  name          = "${var.prefix}-${var.environment}-crawler"
  role          = aws_iam_role.glue_job.arn

  delta_target {
    connection_name = aws_glue_connection.delta_connection.name
    delta_tables    = [
      "s3://${gold_bucket_name}/gas/"
    ]
    write_manifest = "true"
  }
}