const nodemailer = require('nodemailer')
const { email } = require('../config')

const transporter = nodemailer.createTransport(email)

module.exports = () => {
  return {
    sendEmail: (mailOptions, callback) => {
      transporter.sendMail(mailOptions, callback)
    }
  }
}