# 検証用 - デプロイ(個別)
deploy-dev:
	cd /app/src/${ARG} && sls deploy --verbose --config serverless.yml

# 検証用 - 削除(個別)
remove-dev:
	cd /app/src/${ARG} && sls remove --verbose --config serverless.yml

# 本番用 - デプロイ(個別)
deploy-prod:
	cd /app/src/${ARG} && sls deploy --verbose --stage prod --config serverless.yml --aws-profile image-automation

# 本番用 - 削除(個別)
remove-prod:
	cd /app/src/${ARG} && sls remove --stage prod --verbose --config serverless.yml --aws-profile image-automation
