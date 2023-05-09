# 検証用 - デプロイ(個別)
deploy-dev:
	cd ./src/${ARG} && sls deploy --verbose --config serverless.yml

# 検証用 - 削除(個別)
remove-dev:
	cd ./src/${ARG} && sls remove --verbose --config serverless.yml

# 本番用 - デプロイ(個別)
deploy-prod:
	cd ./src/${ARG} && sls deploy --verbose --stage prod --config serverless.yml --aws-profile image-automation

# 本番用 - 削除(個別)
remove-prod:
	cd ./src/${ARG} && sls remove --stage prod --verbose --config serverless.yml --aws-profile image-automation
