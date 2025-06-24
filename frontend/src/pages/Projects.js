import React, { useState, useEffect } from 'react';
import {
  Container,
  Typography,
  Grid,
  Card,
  CardContent,
  CardActions,
  Button,
  Box,
  CircularProgress,
  Alert,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  IconButton,
  Chip,
  Fab,
  Snackbar,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  LinearProgress,
} from '@mui/material';
import {
  Add,
  Edit,
  Delete,
  Close,
  Assignment,
  Category,
  Visibility,
} from '@mui/icons-material';
import { projectService, categoryService } from '../services/api';

const Projects = () => {
  const [projects, setProjects] = useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [openDialog, setOpenDialog] = useState(false);
  const [editingProject, setEditingProject] = useState(null);
  const [snackbar, setSnackbar] = useState({ open: false, message: '', severity: 'success' });
  const [projectTasks, setProjectTasks] = useState({});
  
  // Formulário
  const [formData, setFormData] = useState({
    name: '',
    description: '',
    categoryId: '',
  });

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      setLoading(true);
      setError(null);
      
      const [projectsRes, categoriesRes] = await Promise.all([
        projectService.getProjects(),
        categoryService.getCategories(),
      ]);
      
      setProjects(projectsRes.data);
      setCategories(categoriesRes.data);
      
      // Carregar tarefas para cada projeto
      const tasksData = {};
      for (const project of projectsRes.data) {
        try {
          const tasksRes = await projectService.getProjectTasks(project.id);
          tasksData[project.id] = tasksRes.data;
        } catch (err) {
          tasksData[project.id] = [];
        }
      }
      setProjectTasks(tasksData);
      
    } catch (err) {
      console.error('Erro ao carregar dados:', err);
      setError('Erro ao carregar projetos');
    } finally {
      setLoading(false);
    }
  };

  const handleOpenDialog = (project = null) => {
    if (project) {
      setEditingProject(project);
      setFormData({
        name: project.name,
        description: project.description || '',
        categoryId: project.categoryId || '',
      });
    } else {
      setEditingProject(null);
      setFormData({
        name: '',
        description: '',
        categoryId: '',
      });
    }
    setOpenDialog(true);
  };

  const handleCloseDialog = () => {
    setOpenDialog(false);
    setEditingProject(null);
    setFormData({
      name: '',
      description: '',
      categoryId: '',
    });
  };

  const handleInputChange = (field) => (event) => {
    setFormData({
      ...formData,
      [field]: event.target.value,
    });
  };

  const handleSubmit = async () => {
    try {
      if (!formData.name.trim()) {
        showSnackbar('Nome do projeto é obrigatório', 'error');
        return;
      }

      const dataToSend = {
        ...formData,
        categoryId: formData.categoryId || null,
      };

      if (editingProject) {
        await projectService.updateProject(editingProject.id, dataToSend);
        showSnackbar('Projeto atualizado com sucesso!', 'success');
      } else {
        await projectService.createProject(dataToSend);
        showSnackbar('Projeto criado com sucesso!', 'success');
      }

      handleCloseDialog();
      loadData();
    } catch (err) {
      console.error('Erro ao salvar projeto:', err);
      showSnackbar('Erro ao salvar projeto', 'error');
    }
  };

  const handleDelete = async (projectId) => {
    if (window.confirm('Tem certeza que deseja excluir este projeto? Todas as tarefas serão excluídas também.')) {
      try {
        await projectService.deleteProject(projectId);
        showSnackbar('Projeto excluído com sucesso!', 'success');
        loadData();
      } catch (err) {
        console.error('Erro ao excluir projeto:', err);
        showSnackbar('Erro ao excluir projeto', 'error');
      }
    }
  };

  const showSnackbar = (message, severity) => {
    setSnackbar({ open: true, message, severity });
  };

  const handleCloseSnackbar = () => {
    setSnackbar({ ...snackbar, open: false });
  };

  const getTaskStats = (projectId) => {
    const tasks = projectTasks[projectId] || [];
    const total = tasks.length;
    const completed = tasks.filter(task => task.status === 'completed').length;
    const inProgress = tasks.filter(task => task.status === 'in_progress').length;
    const pending = tasks.filter(task => task.status === 'pending').length;
    
    return { total, completed, inProgress, pending };
  };

  const getProgressPercentage = (projectId) => {
    const stats = getTaskStats(projectId);
    if (stats.total === 0) return 0;
    return Math.round((stats.completed / stats.total) * 100);
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
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 4 }}>
        <Box>
          <Typography variant="h4" gutterBottom>
            Projetos
          </Typography>
          <Typography variant="body1" color="text.secondary">
            Gerencie seus projetos e acompanhe o progresso das tarefas.
          </Typography>
        </Box>
      </Box>

      {/* Grid de Projetos */}
      {projects.length === 0 ? (
        <Box sx={{ textAlign: 'center', py: 8 }}>
          <Assignment sx={{ fontSize: 64, color: 'text.secondary', mb: 2 }} />
          <Typography variant="h6" color="text.secondary" gutterBottom>
            Nenhum projeto encontrado
          </Typography>
          <Typography variant="body2" color="text.secondary" sx={{ mb: 3 }}>
            Crie seu primeiro projeto para começar a organizar suas tarefas.
          </Typography>
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => handleOpenDialog()}
          >
            Criar Projeto
          </Button>
        </Box>
      ) : (
        <Grid container spacing={3}>
          {projects.map((project) => {
            const stats = getTaskStats(project.id);
            const progress = getProgressPercentage(project.id);
            
            return (
              <Grid item xs={12} sm={6} md={4} key={project.id}>
                <Card
                  sx={{
                    height: '100%',
                    display: 'flex',
                    flexDirection: 'column',
                    '&:hover': {
                      boxShadow: 6,
                    },
                  }}
                >
                  <CardContent sx={{ flexGrow: 1 }}>
                    <Box sx={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', mb: 2 }}>
                      <Typography variant="h6" component="h2" sx={{ flexGrow: 1 }}>
                        {project.name}
                      </Typography>
                      {project.Category && (
                        <Chip
                          label={project.Category.name}
                          size="small"
                          style={{ 
                            backgroundColor: project.Category.color || '#1976d2',
                            color: 'white'
                          }}
                        />
                      )}
                    </Box>
                    
                    {project.description && (
                      <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
                        {project.description}
                      </Typography>
                    )}

                    {/* Estatísticas das Tarefas */}
                    <Box sx={{ mb: 2 }}>
                      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 1 }}>
                        <Typography variant="body2" color="text.secondary">
                          Progresso
                        </Typography>
                        <Typography variant="body2" color="text.secondary">
                          {progress}%
                        </Typography>
                      </Box>
                      <LinearProgress 
                        variant="determinate" 
                        value={progress} 
                        sx={{ mb: 1, height: 6, borderRadius: 3 }}
                      />
                      <Typography variant="caption" color="text.secondary">
                        {stats.completed} de {stats.total} tarefas concluídas
                      </Typography>
                    </Box>

                    {/* Chips de Status */}
                    <Box sx={{ display: 'flex', gap: 0.5, flexWrap: 'wrap' }}>
                      {stats.pending > 0 && (
                        <Chip
                          label={`${stats.pending} pendentes`}
                          size="small"
                          color="default"
                          variant="outlined"
                        />
                      )}
                      {stats.inProgress > 0 && (
                        <Chip
                          label={`${stats.inProgress} em progresso`}
                          size="small"
                          color="warning"
                          variant="outlined"
                        />
                      )}
                      {stats.completed > 0 && (
                        <Chip
                          label={`${stats.completed} concluídas`}
                          size="small"
                          color="success"
                          variant="outlined"
                        />
                      )}
                    </Box>
                  </CardContent>

                  <CardActions sx={{ justifyContent: 'space-between', px: 2, pb: 2 }}>
                    <Button
                      size="small"
                      startIcon={<Visibility />}
                      onClick={() => window.location.href = `/tasks?project=${project.id}`}
                    >
                      Ver Tarefas
                    </Button>
                    <Box>
                      <IconButton
                        size="small"
                        onClick={() => handleOpenDialog(project)}
                        color="primary"
                      >
                        <Edit />
                      </IconButton>
                      <IconButton
                        size="small"
                        onClick={() => handleDelete(project.id)}
                        color="error"
                      >
                        <Delete />
                      </IconButton>
                    </Box>
                  </CardActions>
                </Card>
              </Grid>
            );
          })}
        </Grid>
      )}

      {/* FAB para criar novo projeto */}
      <Fab
        color="primary"
        aria-label="add"
        sx={{
          position: 'fixed',
          bottom: 16,
          right: 16,
        }}
        onClick={() => handleOpenDialog()}
      >
        <Add />
      </Fab>

      {/* Dialog para criar/editar projeto */}
      <Dialog open={openDialog} onClose={handleCloseDialog} maxWidth="sm" fullWidth>
        <DialogTitle>
          <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            {editingProject ? 'Editar Projeto' : 'Novo Projeto'}
            <IconButton onClick={handleCloseDialog}>
              <Close />
            </IconButton>
          </Box>
        </DialogTitle>
        
        <DialogContent>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 3, mt: 1 }}>
            <TextField
              label="Nome"
              value={formData.name}
              onChange={handleInputChange('name')}
              fullWidth
              required
              placeholder="Digite o nome do projeto"
            />

            <TextField
              label="Descrição"
              value={formData.description}
              onChange={handleInputChange('description')}
              fullWidth
              multiline
              rows={3}
              placeholder="Descrição opcional do projeto"
            />

            <FormControl fullWidth>
              <InputLabel>Categoria</InputLabel>
              <Select
                value={formData.categoryId}
                onChange={handleInputChange('categoryId')}
                label="Categoria"
              >
                <MenuItem value="">
                  <em>Nenhuma categoria</em>
                </MenuItem>
                {categories.map((category) => (
                  <MenuItem key={category.id} value={category.id}>
                    <Box sx={{ display: 'flex', alignItems: 'center' }}>
                      <Box
                        sx={{
                          width: 16,
                          height: 16,
                          borderRadius: '50%',
                          backgroundColor: category.color || '#1976d2',
                          mr: 1,
                        }}
                      />
                      {category.name}
                    </Box>
                  </MenuItem>
                ))}
              </Select>
            </FormControl>
          </Box>
        </DialogContent>

        <DialogActions>
          <Button onClick={handleCloseDialog}>
            Cancelar
          </Button>
          <Button onClick={handleSubmit} variant="contained">
            {editingProject ? 'Atualizar' : 'Criar'}
          </Button>
        </DialogActions>
      </Dialog>

      {/* Snackbar para feedback */}
      <Snackbar
        open={snackbar.open}
        autoHideDuration={6000}
        onClose={handleCloseSnackbar}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
      >
        <Alert onClose={handleCloseSnackbar} severity={snackbar.severity}>
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Container>
  );
};

export default Projects;