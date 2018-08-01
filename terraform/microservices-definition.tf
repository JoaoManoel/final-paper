variable "autoscaling-microservices" {
  type = "list"

  default = []
}

variable "single-microservices" {
  default = [
    {
      "name"             = "this-socks-inventory-backend"
      "from_port"        = 2334
      "to_port"          = 2334
      "protocol"         = "tcp"
      "min_size"         = 1
      "max_size"         = 3
      "desired_capacity" = 1

      "command" = <<EOF
      docker run -d \
      --name this_socks_inventory_backend \
      --restart always \
      --network this-socks-overlay \
      --dns 169.254.1.1 \
      --publish 2334:2334 \
      --env PORT=2334 \
      --env RABBITMQ_SERVICE=this_socks_rabbitmq.service.consul \
      --env RABBITMQ_USER=socks \
      --env RABBITMQ_PASS=socks \
      --env DB_HOST=this_socks_inventory_database.service.consul \
      --env DB_PORT=5432 \
      --env DB_USER=socks \
      --env DB_PASS= \
      --env DB_NAME=socks_inventory \
      joaomanoel/this_socks_inventory_backend
      EOF
    },
    {
      "name"             = "this-socks-payment-backend"
      "from_port"        = 3344
      "to_port"          = 3344
      "protocol"         = "tcp"
      "min_size"         = 1
      "max_size"         = 3
      "desired_capacity" = 1

      "command" = <<EOF
      docker run -d \
      --name this_socks_payment_backend \
      --restart always \
      --network this-socks-overlay \
      --dns 169.254.1.1 \
      --publish 3344:3344 \
      --env PORT=3344 \
      --env RABBITMQ_SERVICE=this_socks_rabbitmq.service.consul \
      --env RABBITMQ_USER=socks \
      --env RABBITMQ_PASS=socks \
      --env DB_USER=socks \
      --env DB_PASS= \
      --env DB_HOST=this_socks_payment_database.service.consul \
      --env DB_PORT=5432 \
      --env DB_NAME=socks_payment \
      joaomanoel/this_socks_payment_backend
      EOF
    },
    {
      "name"             = "this-socks-recommendation-backend"
      "from_port"        = 2020
      "to_port"          = 2020
      "protocol"         = "tcp"
      "min_size"         = 1
      "max_size"         = 3
      "desired_capacity" = 1

      "command" = <<EOF
      docker run -d \
      --name this_socks_recommendation_backend \
      --restart=always \
      --network this-socks-overlay \
      --dns 169.254.1.1 \
      --publish 2020:2020 \
      --env RABBITMQ_SERVICE=this_socks_rabbitmq.service.consul \
      --env RABBITMQ_USER=socks \
      --env RABBITMQ_PASS=socks \
      --env DB_HOST=this_socks_recommendation_database.service.consul \
      --env DB_USER=socks \
      --env DB_NAME=socks_recommendation \
      --env PORT=2020 \
      joaomanoel/this_socks_recommendation_backend
      EOF
    },
    {
      "name"             = "this-socks-order-backend"
      "from_port"        = 2444
      "to_port"          = 2444
      "protocol"         = "tcp"
      "min_size"         = 1
      "max_size"         = 3
      "desired_capacity" = 1

      "command" = <<EOF
      docker run -d \
      --name this_socks_order_backend \
      --restart=always \
      --network this-socks-overlay \
      --dns 169.254.1.1 \
      --publish 2444:2444 \
      --env RABBITMQ_SERVICE=this_socks_rabbitmq.service.consul \
      --env RABBITMQ_USER=socks \
      --env RABBITMQ_PASS=socks \
      --env EMAIL_SERVICE=this_socks_email.service.consul \
      --env DB_HOST=this_socks_order_database.service.consul \
      --env DB_PORT=27017 \
      --env DB_NAME=socks_order \
      --env PORT=2444 \
      --env SEND_EMAIL=false \
      joaomanoel/this_socks_order_backend
      EOF
    },
    {
      "name"      = "this_socks_payment_database"
      "from_port" = 5432
      "to_port"   = 5432
      "protocol"  = "tcp"

      "command" = <<EOF
      docker run -d \
      --name this_socks_payment_database \
      --network this-socks-overlay \
      --env DB_USER=socks \
      --env DB_NAME=socks_payment \
      --volume /tmp/pgdata:/var/lib/postgresql/data \
      --publish 5432:5432 \
      joaomanoel/this_socks_payment_database
      EOF
    },
    {
      "name"      = "this_socks_recommendation_database"
      "from_port" = 5432
      "to_port"   = 5432
      "protocol"  = "tcp"

      "command" = <<EOF
      docker run -d \
      --name this_socks_recommendation_database \
      --network this-socks-overlay \
      --env DB_USER=socks \
      --env DB_NAME=socks_recommendation \
      --volume /tmp/pgdata:/var/lib/postgresql/data \
      --publish 5432:5432 \
      joaomanoel/this_socks_recommendation_database
      EOF
    },
    {
      "name"      = "this_socks_order_database"
      "from_port" = 27017
      "to_port"   = 27017
      "protocol"  = "tcp"

      "command" = <<EOF
      docker run -d \
      --publish 27017:27017 \
      --network this-socks-overlay \
      --volume /tmp/mongodata:/data/db \
      --name this_socks_order_database \
      --env "SERVICE_NAME=this_socks_order_database" \
      mongo
      EOF
    },
    {
      "name"      = "this_socks_catalog_database"
      "from_port" = 5432
      "to_port"   = 5432
      "protocol"  = "tcp"

      "command" = <<EOF
      docker run -d \
      --name this_socks_catalog_database \
      --network this-socks-overlay \
      --env DB_USER=socks \
      --env DB_NAME=socks_catalog \
      --volume /tmp/pgdata:/var/lib/postgresql/data \
      --publish 5432:5432 \
      joaomanoel/this_socks_catalog_database
      EOF
    },
  ]
}
