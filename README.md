# terraform-variables
terraform の変数を、GitHub Actions 実行下でかつ環境変数を用いて上書きする方法を検証した。

同じ step での環境変数の設定は容易だが、`terraform plan` や `terraform apply` はモジュールを使いたいため非現実的。(same_step.yml)

same_step.yml では Shell で環境変数を設定したが、GitHub Actions の構文で環境変数を設定する方法がある。(GitHub Actions 実践入門 p.30 参照)

same_job.yml では、job スコープの環境変数を設定し、変数を上書きすることができている。

same_job_by_secret.yml では、リポジトリのシークレットに設定した値で上書きすることができている。

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
