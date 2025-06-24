const express = require('express');
const router = express.Router();

// Verificar se cada arquivo de rotas exporta corretamente
let authRoutes, userRoutes, categoryRoutes, projectRoutes, taskRoutes;

try {
  authRoutes = require('./authRoutes');
  console.log('authRoutes carregado:', typeof authRoutes);
} catch (error) {
  console.error('Erro ao carregar authRoutes:', error);
}

try {
  userRoutes = require('./userRoutes');
  console.log('userRoutes carregado:', typeof userRoutes);
} catch (error) {
  console.error('Erro ao carregar userRoutes:', error);
}

try {
  categoryRoutes = require('./categoryRoutes');
  console.log('categoryRoutes carregado:', typeof categoryRoutes);
} catch (error) {
  console.error('Erro ao carregar categoryRoutes:', error);
}

try {
  projectRoutes = require('./projectRoutes');
  console.log('projectRoutes carregado:', typeof projectRoutes);
} catch (error) {
  console.error('Erro ao carregar projectRoutes:', error);
}

try {
  taskRoutes = require('./taskRoutes');
  console.log('taskRoutes carregado:', typeof taskRoutes);
} catch (error) {
  console.error('Erro ao carregar taskRoutes:', error);
}

// Montar rotas apenas se forem válidas
if (authRoutes) router.use('/auth', authRoutes);
if (userRoutes) router.use('/users', userRoutes);
if (categoryRoutes) router.use('/categories', categoryRoutes);
if (projectRoutes) router.use('/projects', projectRoutes);
if (taskRoutes) router.use('/tasks', taskRoutes);

module.exports = router;