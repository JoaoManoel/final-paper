FROM python:3.6-slim-stretch

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 50051

CMD [ "python", "src/email_server.py"]