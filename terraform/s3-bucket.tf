variable "consul_agent-configurations" {
  default = {
    "0" = "bootstrap-config.json"
    "1" = "client-config.json"
    "2" = "server-config.json"
  }
}

variable "machine_status_scripts" {
  default = {
    "0" = "cpu_utilization.sh"
    "1" = "hdd_utilization.sh"
    "2" = "mem_utilization.sh"
  }
}

variable "api_gateway-nginx_configuration" {
  default = {
    "0" = "default"
    "1" = "nginx.conf"
    "2" = "default.ctpl"
  }
}

variable "api_gateway-nodejs-app" {
  default = {
    "0" = "app_gateway.zip"
  }
}

resource "aws_s3_bucket" "this_socks_s3_bucket" {
  bucket = "this-socks-${uuid()}"
  region = "${var.region}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "this_socks_consul_agent-configurations_s3_bucket_files" {
  count                  = "${length(var.consul_agent-configurations)}"
  bucket                 = "${aws_s3_bucket.this_socks_s3_bucket.id}"
  key                    = "consul_agent-configurations/${element(values(var.consul_agent-configurations), count.index)}"
  source                 = "consul_agent-configurations/${element(values(var.consul_agent-configurations), count.index)}"
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "this_socks_machine_status_scripts_s3_bucket_files" {
  count                  = "${length(var.machine_status_scripts)}"
  bucket                 = "${aws_s3_bucket.this_socks_s3_bucket.id}"
  key                    = "machine_status_scripts/${element(values(var.machine_status_scripts), count.index)}"
  source                 = "machine_status_scripts/${element(values(var.machine_status_scripts), count.index)}"
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "this_socks_machine_api_gateway_nginx_s3_bucket_files" {
  count                  = "${length(var.api_gateway-nginx_configuration)}"
  bucket                 = "${aws_s3_bucket.this_socks_s3_bucket.id}"
  key                    = "api_gateway-nginx_configuration/${element(values(var.api_gateway-nginx_configuration), count.index)}"
  source                 = "api_gateway-nginx_configuration/${element(values(var.api_gateway-nginx_configuration), count.index)}"
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "this_socks_machine_api_gateway_app_nodejs" {
  bucket                 = "${aws_s3_bucket.this_socks_s3_bucket.id}"
  key                    = "${element(values(var.api_gateway-nodejs-app), 0)}"
  source                 = "${element(values(var.api_gateway-nodejs-app), 0)}"
  server_side_encryption = "AES256"
}
