FROM golang:1.10-alpine

LABEL maintainer="joaomanoellins@gmail.com"

# install curl
RUN apk add --no-cache curl

# install git && install project dependecies
RUN apk add --no-cache git mercurial \
  && go get -v github.com/gin-gonic/gin \
  && go get -v github.com/jmoiron/sqlx \
  && go get -v github.com/lib/pq \
  && go get -v github.com/streadway/amqp \
  && apk del git mercurial

# create project folder
RUN mkdir -p /opt/inventory

# arguments
ARG GIN_MODE=release
ENV GIN_MODE $GIN_MODE

ARG PORT=2334
ENV PORT $PORT

EXPOSE $PORT

HEALTHCHECK CMD curl -fs http://localhost:$PORT/health || exit 1

WORKDIR /opt/inventory

COPY . ./

RUN go build -o main .

CMD ["./main"]
