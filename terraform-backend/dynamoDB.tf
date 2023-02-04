resource "aws_dynamodb_table" "counter-db" {
  name         = "counter-db"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "counter_type"
    type = "S"
  }

  hash_key     = "counter_type"
}

resource "aws_dynamodb_table_item" "counter-db-item" {
  table_name = aws_dynamodb_table.counter-db.name
  hash_key   = aws_dynamodb_table.counter-db.hash_key

  item = <<ITEM
{
  "counter_type" : {"S": "visitor_counter"},
  "VisitorCount" : {"N": "0"}
}
ITEM
}
