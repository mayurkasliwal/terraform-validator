# terraform-validator
This contains the sample code and steps to use terraform validator for policy enforcement during ci cd pipeline

# steps for using the terraform validator

1. Pre-requisite -
   a. Please make sure you have Terraform latest version installed on your machine
   b. you have policy library of your constraints which you want to enforce/validate on your machine where you will be running terraform

2. for demo purpose below policy library can be clone which validates the labels and storage location for buckets. Please update the policies inside /policies/constraints folder with your org/project values.
 
 git clone https://github.com/mayurkasliwal/policy-library.git

 3. Clone this terraform code on your machine and update dev.tfvars with values applicable for your gcp env.

 git clone https://github.com/mayurkasliwal/terraform-validator.git

go to the terraform-validator folder and run below commands 

 4. Initialize Terraform and generate a Terraform plan using the following:
 terraform init

 5. Export the Terraform plan, if asked, click Authorize when prompted:
 terraform plan -out=test.tfplan
6. Convert the Terraform plan to JSON:
 terraform show -json test.tfplan > tfplan.json
7. Install the terraform-tools component:
 sudo apt-get install google-cloud-sdk-terraform-tools
9. Enter the following command to validate that your Terraform plan complies with your policies:
 gcloud beta terraform vet tfplan.json --policy-library=<path of your policy-library folder> --format=json
 eg gcloud beta terraform vet tfplan_err.json --policy-library=/home/mayur/policy-library --format=json

10 . if there are no issues and your plan is complaint as per policy emtpy output will be shown

however , if some constraints are not met then it will show the details as below -



