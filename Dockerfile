FROM ubuntu:20.04

# Nodejs のバージョン指定
ENV NODE_VERSION 16
# Python のバージョン指定
ENV PYTHON_VERSION 3.8

# serverless framework に必要な値。.env を参照
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
# ARG AWS_PROFILE
# ARG AWS_ORIGINAL_ACCOUNT_ID
# ARG AWS_SWITCH_ROLE
# ARG AWS_SWITCH_ACCOUNT_ID
# ARG AWS_MFA_SERIAL

# 主に python 関連のインストール
RUN apt update && \
    apt install -y --no-install-recommends \
    curl \
    ca-certificates \
    build-essential \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-dev \
    python${PYTHON_VERSION}-distutils \
    python3-pip \
    make \
    vim \
    unzip \
    sudo

# Node.js Python のインストールや設定
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -
RUN apt install -y nodejs
RUN rm -rf /var/lib/apt/lists/*
RUN sudo ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python
RUN python${PYTHON_VERSION} -m pip install --upgrade pip
RUN python${PYTHON_VERSION} -m pip install --no-cache-dir setuptools wheel

# Serverless Framework のインストールと設定
RUN npm install -g serverless@3.28.1
RUN sls config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY
# RUN echo "[profile ${AWS_PROFILE}]" >> ~/.aws/config && \
#     echo "source_profile=default" >> ~/.aws/config && \
#     echo "role_session_name=${AWS_MFA_SERIAL}" >> ~/.aws/config && \
#     echo "region=ap-northeast-1" >> ~/.aws/config && \
#     echo "role_arn=arn:aws:iam::${AWS_SWITCH_ACCOUNT_ID}:role/${AWS_SWITCH_ROLE}" >> ~/.aws/config && \
#     echo "mfa_serial=arn:aws:iam::${AWS_ORIGINAL_ACCOUNT_ID}:mfa/${AWS_MFA_SERIAL}" >> ~/.aws/config
# RUN export AWS_SDK_LOAD_CONFIG=1
# RUN export AWS_PROFILE=${AWS_PROFILE}

WORKDIR /app

# パッケージのインストール
COPY ./deploy/package.json ./deploy/package-lock.json /app/

RUN npm install