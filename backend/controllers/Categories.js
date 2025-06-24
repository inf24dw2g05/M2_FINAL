'use strict';

var utils = require('../utils/writer.js');
var Categories = require('../service/CategoriesService');

module.exports.createCategory = function createCategory (req, res, next, body) {
  Categories.createCategory(req, body)
    .then(function (response) {
      utils.writeJson(res, response, 201);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.deleteCategory = function deleteCategory (req, res, next, categoryId) {
  Categories.deleteCategory(req, categoryId)
    .then(function (response) {
      utils.writeJson(res, response, 204);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.getCategory = function getCategory (req, res, next, categoryId) {
  Categories.getCategory(req, categoryId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 404);
    });
};

module.exports.listCategories = function listCategories (req, res, next) {
  Categories.listCategories(req)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.updateCategory = function updateCategory (req, res, next, body, categoryId) {
  Categories.updateCategory(req, body, categoryId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 404);
    });
};