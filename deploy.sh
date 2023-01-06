#!/bin/bash
set +x

if [ -z "$1" ]
then
   echo "No planname supplied,setting default value for planname"
   export PLANNAME="test"
else
   export PLANNAME=$1
fi

echo $PLANNAME

terraform init
terraform plan  -out=${PLANNAME}.tfplan --var-file=dev.tfvars
terraform show -json ${PLANNAME}.tfplan > ${PLANNAME}.json
VIOLATION=`gcloud beta terraform vet ${PLANNAME}.json --policy-library=/home/mayur/policy-library --format=json`

if [ $VIOLATION = [] ] 
then
    echo "no vilations found applying terrafrom configuration"
    terraform apply --var-file=dev.tfvars
else
    echo "$VIOLATION"
    echo "terrafrom plan has viloations, hence cant proceed with infra deployment"
fi