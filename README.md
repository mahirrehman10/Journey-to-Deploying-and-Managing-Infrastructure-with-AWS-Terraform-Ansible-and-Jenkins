🚀Journey to Deploying and Managing Infrastructure with AWS, Terraform, Ansible, and Jenkins 🌐



I’m excited to share a project where I explored AWS, Terraform, Ansible, and Jenkins to automate deployments and manage infrastructure. Here’s how I did it:



1. AWS Infrastructure with Terraform 🛠️

- Set up a VPC with 2 private and 1 public subnet across availability zones.

- Configured NAT Gateway and Internet Gateway (IGW for internet access.

- Managed traffic flow using route tables.



Key tools used: 

-Terraform for Infrastructure as Code.  

-AWS EC2 for bastion, Jenkins, and app hosts.  

- Security Groups (SGs) for access control.



2. Infrastructure Management with Ansible⚙️

- Installed Docker on Jenkin sand app hosts .

- Configured an inventory file  and  bastion host for secure remote management.



Key tools used: 

- Ansible for provisioning.  

- Docker for containerization.



3. Jenkins Setup & Application Deployment 🏗️

- Installed  Jenkins via  ALB  (Application Load Balancer).

- Created a jenkinsfile to:

 - Git checkout the Node app repo.

 - Docker build the Node app.

 - Push Docker image to ECR.



Key tools used:  

- Jenkins for CI/CD.  

- Docker for containerization.  

-  ECR for Docker image storage.



4. ALB & ECR Configuration🌐🔒

- Configured  ALB to forward traffic from `/jenkins` to the Jenkins target group.

- Created ECR repository and set up IAM roles for secure access to ECR.



5. CI/CD Pipeline for Docker Deployment🏄

- Added a deploy stage in Jenkins to  SSH into the app host, stop old containers, and deploy new ones.



6. Cost Calculation & Documentation 💸

- Calculated the  hourly/monthly cost  of the infrastructure and documented the VPC architecture,



---



 Key Takeaways:

-  Terraform and  Ansible  for automation.

-  Jenkins and  Docker  for CI/CD pipelines.

- Prioritized  security with IAM roles and SSH.







#AWS #Terraform #Ansible #Jenkins #Docker #DevOps #CloudInfrastructure #CI/CD #CloudComputing
