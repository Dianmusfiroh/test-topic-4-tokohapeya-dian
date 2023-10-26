const express = require('express')
const router = express.Router()
const { TestUser, Get, Insert, GetByPK, Update, Delete } = require('../controller/user.controller')
const { CheckPostReq } = require('../middleware/middleware')

router.get('/', Get)
router.get('/TestUser', TestUser)

router.get('/:id', GetByPK)
router.post('/', CheckPostReq, Insert)
router.put('/:id', Update)
router.delete('/:id', Delete)
module.exports = router