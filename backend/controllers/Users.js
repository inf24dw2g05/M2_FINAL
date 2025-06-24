'use strict';

var utils = require('../utils/writer.js');
var Users = require('../service/UsersService');

module.exports.getCurrentUser = function getCurrentUser (req, res, next) {
  Users.getCurrentUser(req)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};

module.exports.updateCurrentUser = function updateCurrentUser (req, res, next, body) {
  Users.updateCurrentUser(req, body)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response, 400);
    });
};