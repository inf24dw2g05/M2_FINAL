const express = require('express');
const router = express.Router();
const UsersController = require('../controllers/Users');
const { ensureAuthenticated } = require('../middleware/auth');

router.get('/me', ensureAuthenticated, (req, res, next) => {
  UsersController.getCurrentUser(req, res, next);
});

router.put('/me', ensureAuthenticated, (req, res, next) => {
  UsersController.updateCurrentUser(req, res, next, req.body);
});

module.exports = router;