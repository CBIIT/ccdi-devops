locals {
  memory = tonumber(var.memory) == 512 ? 2048 : sum([tonumber(var.memory), 1024])
  cpu    = tonumber(var.cpu) == 512 ? 1024 : sum([tonumber(var.cpu), 1024])

  sumologic_container_definition = {
    name              = "${var.program}-${var.app}-${var.microservice}-sumologic-sidecar"
    image             = "amazon/aws-for-fluent-bit:latest"
    essential         = true
    cpu               = 256
    memory            = 512
    memoryReservation = 256

    firelensConfiguration = {
      "type" = "fluentbit"
      "options" = {
        enable-ecs-log-metadata = true
      }
    }
  }

  newrelic_container_definition = {
    name              = "${var.program}-${var.app}-${var.microservice}-newrelic-sidecar"
    image             = "newrelic/nri-ecs:1.10.2"
    essential         = true
    cpu               = 256
    memory            = 512
    memoryReservation = 256
    environment = [
      {
        name  = "NRIA_OVERRIDE_HOST_ROOT"
        value = ""
      },
      {
        name  = "NRIA_IS_FORWARD_ONLY"
        value = "true"
      },
      {
        name  = "FARGATE"
        value = "true"
      },
      {
        name  = "NRIA_PASSTHROUGH_ENVIRONMENT"
        value = "ECS_CONTAINER_METADATA_URI,ECS_CONTAINER_METADATA_URI_V4,FARGATE"
      },
      {
        name  = "NRIA_CUSTOM_ATTRIBUTES",
        value = "{\"nrDeployMethod\":\"downloadPage\"}"
      },
      {
        name  = "NRIA_FEDRAMP"
        value = "true"
      }
    ]

    secrets = [
      {
        name      = "NRIA_LICENSE_KEY",
        valueFrom = var.secret_arn
      }
    ]
  }

  application_container_definition = {
    name              = "${var.program}-${var.app}-${var.microservice}"
    image             = var.container_image_url
    essential         = true
    memoryReservation = var.memory

    portMappings = [
      {
        containerPort = var.port
        hostPort      = var.port
        protocol      = "tcp"
      }
    ]

    environment = var.container_environment_variables

    logConfiguration = {
      logDriver = "awsfirelens"
      options = {
        Name        = "http"
        Host        = "collectors.fed.sumologic.com"
        URI         = "/receiver/v1/http/${var.sumo_collector_token}"
        Port        = "443"
        tls         = "on"
        tls.verify  = "off"
        Format      = "json_lines"
        Retry_Limit = "2"
      }
    }
  }
}
