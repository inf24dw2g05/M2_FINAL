const express = require('express');
const router = express.Router();
const TasksController = require('../controllers/Tasks');
const { ensureAuthenticated } = require('../middleware/auth');

// Remova estas rotas (elas agora estão em projectRoutes.js)
// router.get('/projects/:projectId/tasks', ensureAuthenticated, ...);
// router.post('/projects/:projectId/tasks', ensureAuthenticated, ...);

// Mantenha apenas as rotas para tarefas individuais
router.get('/:taskId', ensureAuthenticated, (req, res, next) => {
  TasksController.getTask(req, res, next, req.params.taskId);
});

router.put('/:taskId', ensureAuthenticated, (req, res, next) => {
  TasksController.updateTask(req, res, next, req.body, req.params.taskId);
});

router.delete('/:taskId', ensureAuthenticated, (req, res, next) => {
  TasksController.deleteTask(req, res, next, req.params.taskId);
});

module.exports = router;