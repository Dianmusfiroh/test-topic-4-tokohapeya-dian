
const { ResponseTemplate } = require('../helper/template.helper')
const Joi = require('joi');

function CheckPostReq(req, res, next) {
    const schema = Joi.object({
        name: Joi.string().alphanum().max(255).required(),
        address: Joi.string().alphanum().required(),
        email: Joi.string().email().required(),
        username: Joi.string().alphanum().max(255).required(),
        password: Joi.string().alphanum().max(255).required(),
    })

    const { error } = schema.validate(req.body)
    if (error) {
        let respErr = ResponseTemplate(null, 'invalid request',
            error.details[0].message, 400)
        res.json(respErr)
        return
    }

    next()
}


module.exports = {
    CheckPostReq
}