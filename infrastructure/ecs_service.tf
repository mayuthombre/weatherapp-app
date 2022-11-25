data "aws_ecs_service" "blue_weatherapp_ecsservice" {
  service_name = "${var.name}-blueservice"
  cluster_arn  = var.blue_cluster_arn
}

resource "aws_ecs_service" "blue_weatherapp_ecsservice" {
  name = "${var.name}-blueservice" 


  tags = merge(
    var.tags,
    {
      environment = "green"
    }
  )
}