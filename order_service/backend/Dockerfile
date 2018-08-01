FROM golang:1.10-alpine

LABEL maintainer="João Manoel Lins <joaomanoellins@gmail.com>"

# install curl
RUN apk add --no-cache curl

# install git && install project dependecies
RUN apk add --no-cache git mercurial \
  && go get -v github.com/gin-gonic/gin \
  && go get -v github.com/globalsign/mgo \
  && go get -v github.com/streadway/amqp \
  && go get -v google.golang.org/grpc \
  && apk del git mercurial

# create project folder
RUN mkdir -p /opt/order

ARG GIN_MODE=release
ENV GIN_MODE $GIN_MODE

ARG PORT=2444
ENV PORT $PORT
EXPOSE $PORT

HEALTHCHECK CMD curl -fs localhost:$PORT/health || exit 1

WORKDIR /opt/order

COPY . ./

RUN go build -o main .

CMD ["./main"]