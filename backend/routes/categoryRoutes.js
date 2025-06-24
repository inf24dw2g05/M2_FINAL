const express = require('express');
const router = express.Router();
const CategoriesController = require('../controllers/Categories');
const { ensureAuthenticated } = require('../middleware/auth');

router.get('/', ensureAuthenticated, (req, res, next) => {
  CategoriesController.listCategories(req, res, next);
});

router.post('/', ensureAuthenticated, (req, res, next) => {
  CategoriesController.createCategory(req, res, next, req.body);
});

router.get('/:categoryId', ensureAuthenticated, (req, res, next) => {
  CategoriesController.getCategory(req, res, next, req.params.categoryId);
});

router.put('/:categoryId', ensureAuthenticated, (req, res, next) => {
  CategoriesController.updateCategory(req, res, next, req.body, req.params.categoryId);
});

router.delete('/:categoryId', ensureAuthenticated, (req, res, next) => {
  CategoriesController.deleteCategory(req, res, next, req.params.categoryId);
});

module.exports = router;