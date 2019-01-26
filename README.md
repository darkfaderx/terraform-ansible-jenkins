# Terraform + Ansible = Jenkins
This project does all the heavy lifting of creating a Jenkins server in Digital Ocean for you.

## Run it.
```
ansible-galaxy install -r requirments.yml
terraform init terraform
terraform apply terraform
```

## Logging into the server
```
./tfx ssh  # Runs: $(terraform output ssh)
```

## Run the Ansible playbook
```
./tfx ansible  # Runs: $(terraform output ansible)
```

# Syncing your jobs
Jobs can be created and configured in Jenkins and then sync'd with your local. The utility script
that will handle this for can be run with the following command.
```
tfx job_sync
```
