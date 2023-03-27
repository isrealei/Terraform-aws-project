resource "aws_key_pair" "delight-key" {
  key_name   = "delightkey"
  public_key = file(var.PUB_KEY_PATH)
}