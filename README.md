
# Terraform State Management 

### Terraform S3 Backend Best Practices
Set up a secure Terraform backend using AWS S3 + DynamoDB


# To create the backend storage:

### Step 1. Change directory
run command 
```shell
cd  01-dynamodb/
tfip && tfa 
cd -
```

### Step 2. Change directory
run command 
```shell
cd   02-s3-bucket/
tfip tfa 
cd - 
```

### Step 2. Change directory
run command
```shell
cd 03-backend/
tfip tfa 
cd - 
```

Now you should be able to store terraform state remotely in the backend.tf file. 

### More about Terraform State 

Managing Terraform State – Best Practices & Examples
Managing Terraform Remote State by Implementing a Remote Backend

What is Terraform state? 
Terraform logs information about the resources it has created in a state file. It is created after running terraform apply.
By default, Terraform stores your state in a terraform.tfstate on the local machine as a plain file in the current working directory.

### Types of Terraform state store
There are two types of store for Terraform state: local and remote.
Local and Remote State

- Local state refers to Terraform state stored on the local filesystem, i.e. on your laptop or whatever system you are running the terraform command from.
- Remote state is Terraform state stored remotely, such as in an S3 bucket or a database like

A remote backend is remote state that can be shared, providing helpful capabilities such as preventing conflicts and inconsistencies.

### Local state  
1. Super-important state files, and a backup
1. which is made before any apply/destroy

```
terraform.tfstate
terraform.tfstate.backup
```

### S3 Backends
We want Terraform to save its state somewhere that's not our local machine. This is extremely important for team colaboration 

Losing state means Terraform loses track of the infrastructure that exists. If that is lost, it will try to delete things that shouldn't be deleted or, more likely, create things that already exist.

To accomplish this, we'll create an S3 bucket to save our state.

Terraform S3 Backend Best Practices
- No public permission
- Encryption enabled
- Deletion protection enabled
- Most importantly: Versioning enabled.

Useful terraform state commands:

```
terraform state list — List the contents of the state file.
terraform state rm — Remove an item from the state file.
terraform state show — Show a resource in the state file.
aws dynamodb list-tables - To list tables
aws dynamodb delete-table --table-name 
aws s3 ls 
aws s3 ls <s3_name>
aws s3 rb s3://<s3_name> --force  
```

**name** – It is a mandatory field that is the name of the table which we are creating.
**billing_mode** – This is an optional option.  Controls the way, you are charged for read and write.
**hash_key** – It is a mandatory field. It is used as the partition key for the table.
**attribute** – It is a mandatory field that is the list of nested attribute definitions. Only required for hash_key and range_key attributes for the table.
**tags** – This is an optional option. It is used to populate the table.
**bucket** – the name of the S3 bucket to store Terraform state files
**key** – Terraform state file name (for the current Terraform module)
**encrypt** – Enable encryption
**region** – the region of the S3 bucket for storing Terraform state
**encrypt** – optional feature, allowing you to encrypt Terraform state file using S3 server-side encryption
**DynamoDB_table** – optional DynamoDB table, which is used to lock Terraform module executions from different machines at the same time
**lifecycle (prevent_destroy)**: This argument prevents us from accidentally or wrongly deleting the bucket

### Terraform state in remote storage S3 and locking with DynamoDB

### Initialize Terraform and create basckend 





