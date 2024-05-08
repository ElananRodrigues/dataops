# --- Internet Gateway ---
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "${var.name_prefix}-igw" }
}

resource "aws_eip" "main" {
  count      = local.azs_count
  depends_on = [aws_internet_gateway.main]
  tags       = { Name = "${var.name_prefix}-eip-${local.azs_names[count.index]}" }
}