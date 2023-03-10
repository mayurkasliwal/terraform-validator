# terraform-validator
This contains the sample code and steps to use terraform validator for policy enforcement during ci cd pipeline

# steps for using the terraform validator

## Pre-requisite -
   a. Please make sure you have Terraform latest version installed on your machine
   
   b. you have policy library of your constraints which you want to enforce/validate on your machine where you will be running terraform
   
   c. You need the following Identity and Access Management (IAM) permissions for that project:
   
   resourcemanager.projects.getIamPolicy – This permission can be granted with the Security Reviewer role for the organization.
   resourcemanager.projects.get – This permission can be granted with the Project Viewer role for the organization.
   
 ## Steps
1. for demo purpose below policy library can be clone which validates the labels and storage location for buckets. Please update the policies inside /policies/constraints folder with your org/project values.
 
    git clone https://github.com/mayurkasliwal/policy-library.git

 2. Clone this terraform code on your machine and update dev.tfvars with values applicable for your gcp env.

    git clone https://github.com/mayurkasliwal/terraform-validator.git

 3. go to the terraform-validator folder and run below command to run the deployment pipeline

 bash deploy.sh test

This will run the script which will create tf plan , validates it against the predefined policies and based on that either
apply configuration if no violations or stop the deployment with appripriate error.

Example of violation found is as below -

![image](https://user-images.githubusercontent.com/81803712/221494441-39b48f62-620b-4451-8fff-3fe2b96bcb5a.png)
![image](https://user-images.githubusercontent.com/81803712/221493961-dd0293c3-9663-4292-997e-d6c33870f9ed.png)


