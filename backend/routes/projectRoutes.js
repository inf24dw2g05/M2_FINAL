const express = require('express');
const router = express.Router();
const ProjectsController = require('../controllers/Projects');
const TasksController = require('../controllers/Tasks'); // Adicione esta linha
const { ensureAuthenticated } = require('../middleware/auth');

// Rotas de projetos existentes
router.get('/', ensureAuthenticated, (req, res, next) => {
  ProjectsController.listProjects(req, res, next);
});

router.post('/', ensureAuthenticated, (req, res, next) => {
  ProjectsController.createProject(req, res, next, req.body);
});

router.get('/:projectId', ensureAuthenticated, (req, res, next) => {
  ProjectsController.getProject(req, res, next, req.params.projectId);
});

router.put('/:projectId', ensureAuthenticated, (req, res, next) => {
  ProjectsController.updateProject(req, res, next, req.body, req.params.projectId);
});

router.delete('/:projectId', ensureAuthenticated, (req, res, next) => {
  ProjectsController.deleteProject(req, res, next, req.params.projectId);
});

// Adicione as rotas de tarefas relacionadas a projetos
router.get('/:projectId/tasks', ensureAuthenticated, (req, res, next) => {
  TasksController.listProjectTasks(req, res, next, req.params.projectId);
});

router.post('/:projectId/tasks', ensureAuthenticated, (req, res, next) => {
  TasksController.createTask(req, res, next, req.body, req.params.projectId);
});

module.exports = router;