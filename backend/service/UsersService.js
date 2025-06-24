'use strict';

const { User } = require('../models');

/**
 * Get current user profile
 * Returns the authenticated user's profile information
 * returns User
 */
exports.getCurrentUser = async function(req) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const user = await User.findByPk(req.user.id);
    
    if (!user) {
      throw new Error('User not found');
    }
    
    return user;
  } catch (error) {
    throw error;
  }
};

/**
 * Update current user profile
 * Updates the authenticated user's profile information
 * body Users_me_body 
 * returns User
 */
exports.updateCurrentUser = async function(req, body) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const user = await User.findByPk(req.user.id);
    
    if (!user) {
      throw new Error('User not found');
    }
    
    if (body.name) user.name = body.name;
    if (body.avatar) user.avatar = body.avatar;
    
    await user.save();
    
    return user;
  } catch (error) {
    throw error;
  }
};