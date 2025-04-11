Most essential Terraform commands you'll use regularly:

### Basic Workflow Commands
```sh
terraform init          # Initialize Terraform (download providers/modules)
terraform plan          # Show execution plan (preview changes)
terraform apply         # Apply changes to infrastructure
terraform destroy       # Destroy managed infrastructure
```

### State Management
```sh
terraform state list    # List resources in state
terraform state show <resource>  # Show details of a resource
terraform state rm <resource>    # Remove item from state
terraform import <resource> <id> # Import existing resource
```

### Workspace Commands
```sh
terraform workspace new <name>    # Create new workspace
terraform workspace select <name> # Switch workspace
terraform workspace list          # List workspaces
```

### Output & Validation
```sh
terraform output        # Show output values
terraform validate      # Validate configuration syntax
terraform fmt          # Format config files to canonical format
```

### Utility Commands
```sh
terraform refresh      # Update state with real infrastructure (apply also refresh)
terraform providers    # Show installed providers
terraform version      # Show Terraform version
```

### Advanced Commands
```sh
terraform taint <resource>  # Mark resource for recreation
terraform untaint <resource> # Remove taint mark
terraform graph           # Generate dependency graph
terraform console         # Interactive console
```

# Terraform State and Import Commands

## State Commands

```bash
# List resources in state
terraform state list

# Show resource details
terraform state show aws_instance.example

# Pull state to stdout
terraform state pull > state.json

# Push state from file
terraform state push state.json

# Move resource in state
terraform state mv aws_instance.old aws_instance.new

# Remove resource from state
terraform state rm aws_instance.example
```

## Import Command

```bash
# Basic import syntax
terraform import ADDRESS ID

# Example: Import AWS EC2 instance
terraform import aws_instance.web i-1234567890abcdef0

# Example: Import with specific state file
terraform import -state=custom.tfstate aws_s3_bucket.bucket bucket-name
```

## Import Workflow
1. Write resource configuration
2. Run import command
3. Verify with `terraform plan`
