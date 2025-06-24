'use strict';

var utils = require('../utils/writer.js');
var Tasks = require('../service/TasksService');

module.exports.createTask = function createTask (req, res, next, body, projectId) {
  Tasks.createTask(req, body, projectId)
    .then(function (response) {
      utils.writeJson(res, response, 201);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.deleteTask = function deleteTask (req, res, next, taskId) {
  Tasks.deleteTask(req, taskId)
    .then(function (response) {
      utils.writeJson(res, response, 204);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.getTask = function getTask (req, res, next, taskId) {
  Tasks.getTask(req, taskId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 404);
    });
};

module.exports.listProjectTasks = function listProjectTasks (req, res, next, projectId) {
  Tasks.listProjectTasks(req, projectId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.updateTask = function updateTask (req, res, next, body, taskId) {
  Tasks.updateTask(req, body, taskId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 404);
    });
};