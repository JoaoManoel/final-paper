import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

gmail_user = ''  
gmail_password = ''

def sendmail(From, to, subject, body):
  msg = MIMEMultipart()
  msg['From'] = From
  msg['To'] = to
  msg['Subject'] = subject
  msg.attach(MIMEText(body, 'html'))
  
  try:
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.ehlo()
    server.starttls()
    server.login(gmail_user, gmail_password)
    server.sendmail(From, to, msg.as_string())
    server.quit()

    return True
  except smtplib.SMTPException as e:
    print(e)
    return False