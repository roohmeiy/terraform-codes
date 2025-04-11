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
terraform refresh      # Update state with real infrastructure
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

Pro Tip: Always run `terraform plan` before `apply` to avoid surprises! Use `-auto-approve` flag with `apply` or `destroy` for non-interactive execution in CI/CD pipelines.