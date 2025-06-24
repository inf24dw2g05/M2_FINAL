'use strict';

const { Category } = require('../models');

/**
 * Create a new category
 */
exports.createCategory = async function(req, body) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const category = await Category.create({
      ...body,
      userId: req.user.id
    });
    
    return category;
  } catch (error) {
    throw error;
  }
};

/**
 * Delete category
 */
exports.deleteCategory = async function(req, categoryId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const category = await Category.findOne({
      where: {
        id: categoryId,
        userId: req.user.id
      }
    });
    
    if (!category) {
      throw new Error('Category not found or access denied');
    }
    
    await category.destroy();
    return;
  } catch (error) {
    throw error;
  }
};

/**
 * Get category details
 */
exports.getCategory = async function(req, categoryId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const category = await Category.findOne({
      where: {
        id: categoryId,
        userId: req.user.id
      }
    });
    
    if (!category) {
      throw new Error('Category not found or access denied');
    }
    
    return category;
  } catch (error) {
    throw error;
  }
};

/**
 * List user categories
 */
exports.listCategories = async function(req) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const categories = await Category.findAll({
      where: {
        userId: req.user.id
      },
      order: [['createdAt', 'DESC']]
    });
    
    return categories;
  } catch (error) {
    throw error;
  }
};

/**
 * Update category
 */
exports.updateCategory = async function(req, body, categoryId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const category = await Category.findOne({
      where: {
        id: categoryId,
        userId: req.user.id
      }
    });
    
    if (!category) {
      throw new Error('Category not found or access denied');
    }
    
    if (body.name) category.name = body.name;
    if (body.color) category.color = body.color;
    if (body.description !== undefined) category.description = body.description;
    
    await category.save();
    
    return category;
  } catch (error) {
    throw error;
  }
};