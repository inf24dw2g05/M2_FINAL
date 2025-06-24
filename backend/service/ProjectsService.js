'use strict';

const { Project, Category } = require('../models');

/**
 * Create a new project
 */
exports.createProject = async function(req, body) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    // If categoryId is provided, verify it belongs to the user
    if (body.categoryId) {
      const category = await Category.findOne({
        where: {
          id: body.categoryId,
          userId: req.user.id
        }
      });
      
      if (!category) {
        throw new Error('Category not found or access denied');
      }
    }
    
    const project = await Project.create({
      ...body,
      userId: req.user.id
    });
    
    return project;
  } catch (error) {
    throw error;
  }
};

/**
 * Delete project
 */
exports.deleteProject = async function(req, projectId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const project = await Project.findOne({
      where: {
        id: projectId,
        userId: req.user.id
      }
    });
    
    if (!project) {
      throw new Error('Project not found or access denied');
    }
    
    await project.destroy();
    return;
  } catch (error) {
    throw error;
  }
};

/**
 * Get project details
 */
exports.getProject = async function(req, projectId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const project = await Project.findOne({
      where: {
        id: projectId,
        userId: req.user.id
      },
      include: [Category]
    });
    
    if (!project) {
      throw new Error('Project not found or access denied');
    }
    
    return project;
  } catch (error) {
    throw error;
  }
};

/**
 * List user projects
 */
exports.listProjects = async function(req) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const projects = await Project.findAll({
      where: {
        userId: req.user.id
      },
      include: [Category],
      order: [['createdAt', 'DESC']]
    });
    
    return projects;
  } catch (error) {
    throw error;
  }
};

/**
 * Update project
 */
exports.updateProject = async function(req, body, projectId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const project = await Project.findOne({
      where: {
        id: projectId,
        userId: req.user.id
      }
    });
    
    if (!project) {
      throw new Error('Project not found or access denied');
    }
    
    // If updating categoryId, verify it belongs to the user
    if (body.categoryId) {
      const category = await Category.findOne({
        where: {
          id: body.categoryId,
          userId: req.user.id
        }
      });
      
      if (!category) {
        throw new Error('Category not found or access denied');
      }
    }
    
    if (body.name) project.name = body.name;
    if (body.description !== undefined) project.description = body.description;
    if (body.categoryId !== undefined) project.categoryId = body.categoryId;
    
    await project.save();
    
    return project;
  } catch (error) {
    throw error;
  }
};