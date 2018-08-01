FROM node:8.11.1-alpine

LABEL maintainer="João Manoel Lins <joaomanoellins@gmail.com>"

# Install curl
RUN apk add --no-cache curl

# Create the app folder
RUN mkdir -p /opt/review

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# compose overrides this on build and run
ARG PORT=2018
ENV PORT $PORT
EXPOSE $PORT

# check every 30s to ensure this service returns HTTP 200
HEALTHCHECK CMD curl -fs http://localhost:$PORT/health || exit 1

WORKDIR /opt/review
COPY . ./
RUN npm install && npm cache clean --force

CMD ["node", "app.js"]
