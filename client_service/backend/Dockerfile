FROM node:8.11.1-alpine

LABEL maintainer="joaomanoellins@gmail.com"

# Install curl
RUN apk add --no-cache curl
# RUN npm i -g nodemon

# Create the app folder
RUN mkdir -p /opt/client

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# port 9229 for debug
# compose overrides this on build and run
ARG PORT=2004
ENV PORT $PORT

# check every 30s to ensure this service returns HTTP 200
HEALTHCHECK CMD curl -fs http://localhost:$PORT/health || exit 1

WORKDIR /opt/client
COPY . ./
RUN npm install && npm cache clean --force

CMD ["node", "app.js"]