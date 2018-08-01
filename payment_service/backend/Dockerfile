FROM python:3.6-alpine

LABEL maintainer="joaomanoellins@gmail.com"

# install curl
RUN apk update \
  && apk add --no-cache curl gcc python3-dev musl-dev \
  && apk add --virtual build-deps \
  && apk add postgresql-dev \
  && apk del build-deps

RUN mkdir -p /opt/payment

ARG PORT=3344
ENV PORT $PORT

HEALTHCHECK CMD curl -fs http://localhost:$PORT/health || exit 1

WORKDIR /opt/payment

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]