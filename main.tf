# resource local_file my_file {
#     filename = about.txt
#     content = "Hello everyone I am Hamza Ejaz."
# } 
resource "aws_s3" "my_s3" {
    s3_name = "hamza"
    region = "us-east1"
    permission = "readwriteOnce"
  
}