# gcp-terraform-modules
Repositories with terraform GCP modules

```bash
terraform init
```

**Check modifications**

```bash
terraform plan
```

**Apply modifications**

```bash
terraform apply
```

**Generate docs**

```bash
terraform-docs -c .terraform-docs.yaml modules/{module-path}
```

**Generate all docs**

```bash
for d in $(ls -1 modules); do terraform-docs -c .terraform-docs.yml modules/$d; done
```
