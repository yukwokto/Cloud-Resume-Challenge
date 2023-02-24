# Cloud-Resume-Challenge

Introduction
Welcome to my Cloud Resume Challenge repository, where I showcase my first project developed using the AWS platform. The goal of this project was to build a static resume website and host it on the cloud.

Website
The static resume website is hosted on Amazon S3 and is accessible at the following URL: https://yukwokto-resume.com/. The website is secured with SSL/TLS using an SSL certificate provided by AWS Certificate Manager.

AWS Services
The major AWS services utilized in this project are:

Amazon S3 for hosting the static website and storing its files
Amazon CloudFront for content delivery and caching
Amazon Route 53 for DNS management and domain registration
AWS IAM for managing access to AWS resources
AWS Lambda for serverless computing
AWS API Gateway for creating RESTful APIs
Amazon DynamoDB for storing data
Infrastructure as Code
In addition to using AWS services, I also experimented with Infrastructure as Code (IaC) using Terraform. The terraform folder contains the code for creating the cloud infrastructure. The Terraform template successfully created the backend components of the website.

Future Improvements
If I had more time, I would like to develop a CI/CD pipeline for further automation. I welcome any suggestions or feedback you may have! Please feel free to reach out to me if you have any questions or comments.
