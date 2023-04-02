resource "aws_config_config_rule" "kinesis_stream_encrypted" {
  name        = "kinesis-stream-encrypted"
  description = "Checks whether Amazon Kinesis Data Streams are encrypted."

  source {
    owner             = "AWS"
    source_identifier = "KINESIS_STREAM_ENCRYPTED"
  }
}
