FROM node:16.18.1-slim

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

RUN apt update && apt install -y make

RUN npm install -g serverless@3.28.1

RUN sls config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY

WORKDIR /usr/app