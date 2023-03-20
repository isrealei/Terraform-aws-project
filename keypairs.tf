resource "aws_key_pair" "deligh-key" {
  key_name = "delightkey"
  public_key = file(var.PUB_KEY_PATH)
}