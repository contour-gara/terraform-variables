# terraform-variables
## Run local
```shell
export TF_VAR_test="changed"
terraform plan
```

## Run by act
```chell
act -j Set-enviroment-in-same-step -W .github/workflows/same_step.yml
act -j Set-enviroment-in-same-job -W .github/workflows/same_job.yml
act -s TF_VAR_test=changed -j Set-enviroment-in-same-job-by-secret -W .github/workflows/same_job_by_secret.yml
```
