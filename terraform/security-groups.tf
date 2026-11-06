resource "aws_security_group" "observability" {
  name        = "${var.project_name}-ec2-sg"
  description = "No inbound ports; administer the instance through AWS Systems Manager Session Manager."
  vpc_id      = aws_vpc.observability.id

  # Deliberately no ingress rules. Grafana and monitoring ports must not
  # be exposed to the public internet. Use SSM port forwarding when needed.

  egress {
    description = "Allow outbound HTTPS, package downloads and AWS service access."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-ec2-sg"
    Project = var.project_name
  }
}
