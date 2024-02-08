export TERRAGRUNT_TFPATH=tofu
find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
terragrunt run-all init
terragrunt run-all apply --terragrunt-non-interactive 
# cd dev
# find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
# terragrunt apply -auto-approve --terragrunt-non-interactive
# cd ../prod
# find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
# terragrunt apply -auto-approve --terragrunt-non-interactive