# --- ECS Task Definition ---

resource "aws_ecs_task_definition" "app" {
  family             = "demo-app"
  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_exec_role.arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 256

  container_definitions = jsonencode([{
    name         = "app",
    image        = "nginx:latest",
    essential    = true,
    portMappings = [{ containerPort = 80, hostPort = 80 }],

    environment = []

    # logConfiguration = {
    #   logDriver = "awslogs",
    #   options = {
    #     "awslogs-region"        = "us-east-1",
    #     "awslogs-group"         = "/ecs/demo-app",
    #     "awslogs-stream-prefix" = "app"
    #   }
    # },
  }])
}