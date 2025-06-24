// src/pages/Dashboard.js
import React, { useState, useEffect } from 'react';
import {
  Container,
  Typography,
  Grid,
  Card,
  CardContent,
  Box,
  CircularProgress,
  Alert,
  Chip,
  LinearProgress,
} from '@mui/material';
import {
  Assignment,
  Category,
  Task,
  TrendingUp,
} from '@mui/icons-material';
import { projectService, categoryService } from '../services/api';

const Dashboard = () => {
  const [stats, setStats] = useState({
    totalProjects: 0,
    totalCategories: 0,
    totalTasks: 0,
    completedTasks: 0,
    pendingTasks: 0,
    inProgressTasks: 0,
  });
  const [recentProjects, setRecentProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadDashboardData();
  }, []);

  const loadDashboardData = async () => {
    try {
      setLoading(true);
      setError(null);

      // Carregar dados em paralelo
      const [projectsRes, categoriesRes] = await Promise.all([
        projectService.getProjects(),
        categoryService.getCategories(),
      ]);

      const projects = projectsRes.data;
      const categories = categoriesRes.data;

      // Carregar tarefas de todos os projetos
      const tasksPromises = projects.map(project => 
        projectService.getProjectTasks(project.id).catch(() => ({ data: [] }))
      );
      const tasksResults = await Promise.all(tasksPromises);
      const allTasks = tasksResults.flatMap(result => result.data);

      // Calcular estatísticas
      const completedTasks = allTasks.filter(task => task.status === 'completed').length;
      const pendingTasks = allTasks.filter(task => task.status === 'pending').length;
      const inProgressTasks = allTasks.filter(task => task.status === 'in_progress').length;

      setStats({
        totalProjects: projects.length,
        totalCategories: categories.length,
        totalTasks: allTasks.length,
        completedTasks,
        pendingTasks,
        inProgressTasks,
      });

      // Projetos mais recentes (últimos 5)
      setRecentProjects(projects.slice(0, 5));

    } catch (err) {
      console.error('Erro ao carregar dados do dashboard:', err);
      setError('Erro ao carregar dados do dashboard');
    } finally {
      setLoading(false);
    }
  };

  const getTaskProgress = () => {
    if (stats.totalTasks === 0) return 0;
    return (stats.completedTasks / stats.totalTasks) * 100;
  };

  if (loading) {
    return (
      <Container sx={{ mt: 4, display: 'flex', justifyContent: 'center' }}>
        <CircularProgress size={60} />
      </Container>
    );
  }

  if (error) {
    return (
      <Container sx={{ mt: 4 }}>
        <Alert severity="error">{error}</Alert>
      </Container>
    );
  }

  return (
    <Container sx={{ mt: 4 }}>
      <Typography variant="h4" gutterBottom>
        Dashboard
      </Typography>
      
      <Typography variant="body1" color="text.secondary" sx={{ mb: 4 }}>
        Bem-vindo ao Task Manager! Aqui você pode ver um resumo dos seus projetos e tarefas.
      </Typography>

      {/* Cards de Estatísticas */}
      <Grid container spacing={3} sx={{ mb: 4 }}>
        <Grid item xs={12} sm={6} md={3}>
          <Card>
            <CardContent>
              <Box sx={{ display: 'flex', alignItems: 'center', mb: 1 }}>
                <Assignment color="primary" sx={{ mr: 1 }} />
                <Typography variant="h6">Projetos</Typography>
              </Box>
              <Typography variant="h4" color="primary">
                {stats.totalProjects}
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Total de projetos
              </Typography>
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} sm={6} md={3}>
          <Card>
            <CardContent>
              <Box sx={{ display: 'flex', alignItems: 'center', mb: 1 }}>
                <Category color="secondary" sx={{ mr: 1 }} />
                <Typography variant="h6">Categorias</Typography>
              </Box>
              <Typography variant="h4" color="secondary">
                {stats.totalCategories}
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Total de categorias
              </Typography>
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} sm={6} md={3}>
          <Card>
            <CardContent>
              <Box sx={{ display: 'flex', alignItems: 'center', mb: 1 }}>
                <Task color="success" sx={{ mr: 1 }} />
                <Typography variant="h6">Tarefas</Typography>
              </Box>
              <Typography variant="h4" color="success">
                {stats.totalTasks}
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Total de tarefas
              </Typography>
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} sm={6} md={3}>
          <Card>
            <CardContent>
              <Box sx={{ display: 'flex', alignItems: 'center', mb: 1 }}>
                <TrendingUp color="info" sx={{ mr: 1 }} />
                <Typography variant="h6">Progresso</Typography>
              </Box>
              <Typography variant="h4" color="info">
                {Math.round(getTaskProgress())}%
              </Typography>
              <Typography variant="body2" color="text.secondary">
                Tarefas concluídas
              </Typography>
              <LinearProgress 
                variant="determinate" 
                value={getTaskProgress()} 
                sx={{ mt: 1 }}
              />
            </CardContent>
          </Card>
        </Grid>
      </Grid>

      {/* Resumo de Tarefas */}
      <Grid container spacing={3} sx={{ mb: 4 }}>
        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Status das Tarefas
              </Typography>
              <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <Chip 
                    label={`Concluídas: ${stats.completedTasks}`}
                    color="success"
                    variant="outlined"
                  />
                  <Typography variant="body2">
                    {stats.totalTasks > 0 ? Math.round((stats.completedTasks / stats.totalTasks) * 100) : 0}%
                  </Typography>
                </Box>
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <Chip 
                    label={`Em Progresso: ${stats.inProgressTasks}`}
                    color="warning"
                    variant="outlined"
                  />
                  <Typography variant="body2">
                    {stats.totalTasks > 0 ? Math.round((stats.inProgressTasks / stats.totalTasks) * 100) : 0}%
                  </Typography>
                </Box>
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <Chip 
                    label={`Pendentes: ${stats.pendingTasks}`}
                    color="default"
                    variant="outlined"
                  />
                  <Typography variant="body2">
                    {stats.totalTasks > 0 ? Math.round((stats.pendingTasks / stats.totalTasks) * 100) : 0}%
                  </Typography>
                </Box>
              </Box>
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Projetos Recentes
              </Typography>
              {recentProjects.length === 0 ? (
                <Typography variant="body2" color="text.secondary">
                  Nenhum projeto encontrado
                </Typography>
              ) : (
                <Box sx={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
                  {recentProjects.map((project) => (
                    <Box
                      key={project.id}
                      sx={{
                        p: 2,
                        border: 1,
                        borderColor: 'divider',
                        borderRadius: 1,
                        '&:hover': {
                          backgroundColor: 'action.hover',
                        },
                      }}
                    >
                      <Typography variant="subtitle2" gutterBottom>
                        {project.name}
                      </Typography>
                      <Typography variant="body2" color="text.secondary" noWrap>
                        {project.description || 'Sem descrição'}
                      </Typography>
                      {project.Category && (
                        <Chip
                          label={project.Category.name}
                          size="small"
                          sx={{ mt: 1 }}
                          style={{ backgroundColor: project.Category.color }}
                        />
                      )}
                    </Box>
                  ))}
                </Box>
              )}
            </CardContent>
          </Card>
        </Grid>
      </Grid>
    </Container>
  );
};

export default Dashboard;