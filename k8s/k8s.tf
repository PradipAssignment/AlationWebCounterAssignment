resource "kubernetes_manifest" "deployment_dev_webcounter_altion_deployment" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "dev-webcounter-altion"
      }
      "name" = "dev-webcounter-altion-deployment"
    }
    "spec" = {
      "replicas" = 3
      "selector" = {
        "matchLabels" = {
          "app" = "dev-webcounter-altion"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "dev-webcounter-altion"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "pdpatel/dev-webcounter-altion"
              "name" = "dev-webcounter-altion"
              "ports" = [
                {
                  "containerPort" = 5000
                },
              ]
              "resources" = {
                "requests" = {
                  "cpu" = "300m"
                  "memory" = "128Mi"
                }
              }
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "deployment_redis_deployment" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "redis"
      }
      "name" = "redis-deployment"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "redis"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "redis"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "redis:3.2-alpine"
              "name" = "redis"
              "ports" = [
                {
                  "containerPort" = 6379
                },
              ]
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "service_dev_webcounter_altion_loadbalancer" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "dev-webcounter-altion-loadbalancer"
    }
    "spec" = {
      "ports" = [
        {
          "port" = 80
          "protocol" = "TCP"
          "targetPort" = 5000
        },
      ]
      "selector" = {
        "app" = "dev-webcounter-altion"
      }
      "type" = "LoadBalancer"
    }
  }
}

resource "kubernetes_manifest" "service_redis_node" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "name" = "redis-node"
    }
    "spec" = {
      "ports" = [
        {
          "port" = 6379
          "protocol" = "TCP"
          "targetPort" = 6379
        },
      ]
      "selector" = {
        "app" = "redis"
      }
      "type" = "ClusterIP"
    }
  }
}
