<<<<<<< HEAD
# sql-rds
=======
# terraform_modules
terraform modules to build a 2 tier-architecture with route 53
>>>>>>> main


when using HTTPS for your application load balancer 
you generate your own certificate for ssl/tls authentication

To generate your own IAM server certificate and its ARN:

Create a Certificate: You can generate a certificate using AWS Certificate Manager (ACM) or upload your own certificate if it's issued by a certificate authority (CA).

Once the certificate is created, you can find your ARN in the AWS Management Console or by using the AWS CLI:

sh
Copy code
aws iam list-server-certificates

After obtaining the certificate ARN, you can use it in your Terraform resource configuration