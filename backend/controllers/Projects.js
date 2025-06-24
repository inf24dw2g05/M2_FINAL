'use strict';

var utils = require('../utils/writer.js');
var Projects = require('../service/ProjectsService');

module.exports.createProject = function createProject (req, res, next, body) {
  Projects.createProject(req, body)
    .then(function (response) {
      utils.writeJson(res, response, 201);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.deleteProject = function deleteProject (req, res, next, projectId) {
  Projects.deleteProject(req, projectId)
    .then(function (response) {
      utils.writeJson(res, response, 204);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.getProject = function getProject (req, res, next, projectId) {
  Projects.getProject(req, projectId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 404);
    });
};

module.exports.listProjects = function listProjects (req, res, next) {
  Projects.listProjects(req)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.updateProject = function updateProject (req, res, next, body, projectId) {
  Projects.updateProject(req, body, projectId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 404);
    });
};