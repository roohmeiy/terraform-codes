added module- instance,s3,db with multi env config
```bash
terraform apply -var-file=dev.tfvars
terraform apply -var-file=prd.tfvars
terraform apply -var-file=stg.tfvars
```
