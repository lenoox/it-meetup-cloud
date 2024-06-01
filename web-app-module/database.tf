#resource "aws_docdb_cluster" "it-meetup-db" {
#  cluster_identifier      = "it-meetup-db"
#  engine                  = "docdb"
#  master_username         = var.db_user
#  master_password         = var.db_pass
#  skip_final_snapshot     = true
#}