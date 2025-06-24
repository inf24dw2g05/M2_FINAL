'use strict';

const { Task, Project } = require('../models');

/**
 * Create a new task
 */
exports.createTask = async function(req, body, projectId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    // Verify project belongs to user
    const project = await Project.findOne({
      where: {
        id: projectId,
        userId: req.user.id
      }
    });
    
    if (!project) {
      throw new Error('Project not found or access denied');
    }
    
    const task = await Task.create({
      ...body,
      projectId: projectId
    });
    
    return task;
  } catch (error) {
    throw error;
  }
};

/**
 * Delete task
 */
exports.deleteTask = async function(req, taskId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const task = await Task.findOne({
      where: { id: taskId },
      include: [{
        model: Project,
        where: { userId: req.user.id }
      }]
    });
    
    if (!task) {
      throw new Error('Task not found or access denied');
    }
    
    await task.destroy();
    return;
  } catch (error) {
    throw error;
  }
};

/**
 * Get task details
 */
exports.getTask = async function(req, taskId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const task = await Task.findOne({
      where: { id: taskId },
      include: [{
        model: Project,
        where: { userId: req.user.id }
      }]
    });
    
    if (!task) {
      throw new Error('Task not found or access denied');
    }
    
    return task;
  } catch (error) {
    throw error;
  }
};

/**
 * List project tasks
 */
exports.listProjectTasks = async function(req, projectId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    // Verify project belongs to user
    const project = await Project.findOne({
      where: {
        id: projectId,
        userId: req.user.id
      }
    });
    
    if (!project) {
      throw new Error('Project not found or access denied');
    }
    
    const tasks = await Task.findAll({
      where: { projectId: projectId },
      order: [['createdAt', 'DESC']]
    });
    
    return tasks;
  } catch (error) {
    throw error;
  }
};

/**
 * Update task
 */
exports.updateTask = async function(req, body, taskId) {
  try {
    if (!req.user || !req.user.id) {
      throw new Error('User not authenticated');
    }
    
    const task = await Task.findOne({
      where: { id: taskId },
      include: [{
        model: Project,
        where: { userId: req.user.id }
      }]
    });
    
    if (!task) {
      throw new Error('Task not found or access denied');
    }
    
    if (body.title) task.title = body.title;
    if (body.description !== undefined) task.description = body.description;
    if (body.status) task.status = body.status;
    if (body.priority) task.priority = body.priority;
    if (body.dueDate) task.dueDate = body.dueDate;
    
    await task.save();
    
    return task;
  } catch (error) {
    throw error;
  }
};