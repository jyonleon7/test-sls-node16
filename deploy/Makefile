# 検証用 - デプロイ(個別)
deploy-dev:
	cd ./src/${ARG} && sls deploy --verbose --config serverless.yml

# 検証用 - 削除(個別)
remove-dev:
	cd ./src/${ARG} && sls remove --verbose --config serverless.yml

# 本番用 - デプロイ(個別)
deploy-prod:
	cd ./src/${ARG} && sls deploy --verbose --stage prod --config serverless.yml

# 本番用 - 削除(個別)
remove-prod:
	cd ./src/${ARG} && sls remove --verbose --stage prod --config serverless.yml

# --- これより下は権限問題のため、使用しない可能性が高い（削除しても良いかもが念の為） ---
# docker 検証用 - デプロイ(個別)
docker-deploy-dev:
	cd ./src/${ARG} && sls deploy --verbose --config serverless.yml --aws-profile ${AWS_PROFILE}

# docker 検証用 - 削除(個別)
docker-remove-dev:
	cd ./src/${ARG} && sls remove --verbose --config serverless.yml --aws-profile ${AWS_PROFILE}