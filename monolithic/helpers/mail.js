const nodemailer = require('nodemailer')
const { email } = require('../config')

const transporter = nodemailer.createTransport(email)
const isSendEmailEnabled = process.env.SEND_EMAIL || 'false'


module.exports = () => {
  return {
    sendEmail: (mailOptions, callback) => {
      if (isSendEmailEnabled == 'true')
        transporter.sendMail(mailOptions, callback)
      else
        callback(null)
    },
    sendOrderEmail: (params, callback) => {
      if (isSendEmailEnabled == 'true')
        transporter.sendMail({
          from: '"This Socks!" <mail@thissocks.com>',
          to: `"${params.email}" <${params.email}>`,
          subject: params.subject,
          html: `Olá,<br><br> 
          Recebemos seu novo pedido: <b>${params.order_id}</b><br><br>
          Status é <b>${params.status}</b> <br><br><br>
          Em caso de dúvidas, nos procure! <br>
          Equipe This Socks!`
        }, callback)
      else
        callback(null)
    }
  }
}