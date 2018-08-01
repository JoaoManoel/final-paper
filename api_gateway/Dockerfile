FROM node:8.11.1-alpine

LABEL maintainer="joaomanoellins@gmail.com"

RUN mkdir -p /etc/api_gateway

ARG MODE=prod
ENV MODE $MODE

ARG PORT=3000
ENV PORT $PORT

WORKDIR /etc/api_gateway

COPY . .

RUN npm install && npm cache clean --force

CMD ["node", "app.js"]