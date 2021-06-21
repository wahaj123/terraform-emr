# terraform { 
#   backend "s3" { 
#     profile        = "wahaj"
#     bucket         = "terraform-backend-statefile"
#     dynamodb_table = "terraform_backend"
#     region         = "us-east-2"
#     key            = "terraform.tfstate"
#   }
# }