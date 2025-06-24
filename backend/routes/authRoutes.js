const express = require('express');
const passport = require('passport');
const authController = require('../controllers/authController');
const router = express.Router();

// Iniciar autenticação com Google
router.get('/google', 
  passport.authenticate('google', { scope: ['profile', 'email'] })
);

// Callback do Google
router.get('/google/callback', 
  passport.authenticate('google', { failureRedirect: '/login' }),
  authController.googleCallback
);

// Logout
router.get('/logout', authController.logout);

// Status de autenticação
router.get('/status', authController.getAuthStatus);

module.exports = router;