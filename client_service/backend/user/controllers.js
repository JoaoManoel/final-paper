const router = require('express').Router()
const Joi = require('joi')
const randomstring = require('randomstring')
const schema = require('./schema')
const queries = require('./queries')
const { email } = require('../helpers')

router.post('/', (req, res, next) => {
  const body = req.body
  Joi.validate(body, schema, (err, _) => {
    if (err) {
      return res.status(400).json({ status: 'ERROR', msg: err.details[0].message })
    } else {
      queries().create(body, (err, _) => {
        if (err) {
          if (err.detail.indexOf('already exists') > -1) {
            return res.status(409)
              .json({ status: 'ERROR', msg: 'email já cadastrado.' })
          }

          next({ err })
        } else res.json({ status: 'OK', msg: 'Usuário criado com sucesso.' })
      })
    }
  })
})

router.post('/activate/:code', (req, res, next) => {
  const code = req.params.code
  queries().activate(code, (err, response) => {
    if (err) next({ err })
    else {
      if (response.rowCount > 0) { 
        res.json({ status: 'OK', msg: 'Cadastro confirmado.' }) 
      } else { 
        res.status(404).json({ status: 'ERROR', msg: 'Cadastro não encontrado.' }) 
      }
    }
  })
})

router.put('/:id/password', (req, res, next) => {
  const id = req.params.id
  const password = req.body.password
  queries().update(id, password, (err, response) => {
    if (err) next({ err })
    else {
      if (response.rowCount > 0) {
        res.json({ status: 'OK', msg: 'Senha atualizada com sucesso.' })
      } else {
        res.status(404).json({ status: 'ERROR', msg: 'Cadastro não encontrado.' })
      }
    }
  })
})

router.post('/:id/recoveryPassword', (req, res, next) => {
  const id = req.params.id
  queries().findUserByClientId(id, (_, response) => {
    if (response.rowCount > 0) {
      const user = response.rows[0]
      const newPassword = randomstring.generate(15)

      queries().recovery(id, newPassword, (err, _) => {
        if (err) next({ err })
        else {
          email().sendEmail({
            from: '"This Socks!" <mail@thissocks.com>',
            to: `"${user.email}" <${user.email}>`,
            subject: 'Recuperação de Senha',
            html: `Olá ${user.name},<br><br> 
            Sua senha de acesso foi alterada.<br><br>
            A nova senha de acesso é <b>${newPassword}</b> <br><br><br>
            Em caso de dúvidas, nos procure! <br><br><br>
            Equipe This Socks!`
          }, (err, _) => {
            if (err) next({ err })
            else res.json({ status: 'OK', msg: 'Sua nova senha foi enviada para seu email cadastrado.' })
          })
        }
      })
    } else {
      res.status(404).json({ status: 'ERROR', msg: 'Cadastro não encontrado.' })
    }
  })
})

module.exports = router
