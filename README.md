# Learning-Terraform

Install unzip on vm because unzip in not install by default
so run these command before installing the aws cli on server

```
sudo apt-get update && sudo apt-get install unzip
```

## Intstall AWS CLI on server

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install

```
## Create user on AWS Cloud  for terraform acess
I give it admin acess but its not for production because production is more secure enviorment....

<img width="1782" height="462" alt="image" src="https://github.com/user-attachments/assets/327484cf-3e54-40b2-98ef-39f052e80e33" />

### Lets Configure the  Aws user to ec2 :

```
aws configure
```
after this command paste the Access key and Secret access key
### Read this Docs For learning terraform:
```
https://registry.terraform.io/providers/hashicorp/aws/latest/docs
```
