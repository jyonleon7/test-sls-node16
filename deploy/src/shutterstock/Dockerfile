FROM public.ecr.aws/lambda/nodejs:16

COPY package.json package-lock.json /var/task/

RUN npm install

CMD [ "shutterstock.handler" ]