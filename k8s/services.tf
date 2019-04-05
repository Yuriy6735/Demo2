###################
### K8S Service ###
###################
resource "kubernetes_service" "mongo-master" {
  metadata {
    name = "mongo-master"

    labels {
      app  = "mongo"
      role = "master"
      tier = "backend"
    }
  }

  spec {
    selector {
      app  = "mongo"
      role = "master"
      tier = "backend"
    }

    type = "LoadBalancer"

    port {
      port        = 27017
      target_port = 27017
    }
  }
}

output "ip" {
  value = "${kubernetes_service.mongo-master.load_balancer_ingress.0.ip}"
}

resource "kubernetes_service" "redis-master" {
  metadata {
    name = "redis-master"

    labels {
      app  = "redis"
      role = "master"
      tier = "backend"
    }
  }

  spec {
    selector {
      app  = "redis"
      role = "master"
      tier = "backend"
    }

    type = "LoadBalancer"

    port {
      port        = 6379
      target_port = 6379
    }
  }
}

output "ip_redis" {
  value = "${kubernetes_service.redis-master.load_balancer_ingress.0.ip}"
}

/*
resource "kubernetes_service" "mongo-slave" {
  metadata {
    name = "mongo-slave"

    labels {
      app  = "mongo"
      role = "slave"
      tier = "backend"
    }
  }

  spec {
    selector {
      app  = "mongo"
      role = "slave"
      tier = "backend"
    }

    port {
      port        = 27017
      target_port = 27017
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend"

    labels {
      app  = "mongodb"
      tier = "frontend"
    }
  }

  spec {
    selector {
      app  = "mongodb"
      tier = "frontend"
    }

    type = "LoadBalancer"

    port {
      port = 27017
    }
  }
}
*/

