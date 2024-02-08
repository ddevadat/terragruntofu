export TERRAGRUNT_TFPATH=tofu
cd dev
terragrunt destroy -auto-approve --terragrunt-non-interactive
cd ../prod
terragrunt destroy -auto-approve --terragrunt-non-interactive