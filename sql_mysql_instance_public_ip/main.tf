# [START cloud_sql_mysql_instance_public_ip]
resource "google_sql_database_instance" "mysql_public_ip_instance_name" {
  database_version = "MYSQL_5_7"
  name             = "mysql-public-ip-instance-name"
  region           = "asia-southeast2"
  settings {
    availability_type = "ZONAL"
    disk_size         = 100
    disk_type         = "PD_SSD"
    ip_configuration {
      # Add optional authorized networks
      # Update to match the customer's networks
      authorized_networks {
        name  = "test-net-3"
        value = "203.0.113.0/24"
      }
      # Enable public IP
      ipv4_enabled = true
    }
    tier = "db-custom-4-26624"
  }
  deletion_protection = false # set to true to prevent destruction of the resource
}
# [END cloud_sql_mysql_instance_public_ip]
