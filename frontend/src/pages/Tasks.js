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
  Paper,
  ToggleButton,
  ToggleButtonGroup,
  Avatar,
} from '@mui/material';
import {
  Add,
  Edit,
  Delete,
  Close,
  Task,
  FilterList,
  CheckCircle,
  Schedule,
  PlayCircle,
  Event,
  PriorityHigh,
  Assignment,
} from '@mui/icons-material';
import { projectService, taskService } from '../services/api';

const Tasks = () => {
  const [tasks, setTasks] = useState([]);
  const [projects, setProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [openDialog, setOpenDialog] = useState(false);
  const [editingTask, setEditingTask] = useState(null);
  const [snackbar, setSnackbar] = useState({ open: false, message: '', severity: 'success' });
  
  // Filtros
  const [filters, setFilters] = useState({
    status: 'all',
    priority: 'all',
    project: 'all',
  });

  // Formulário
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    status: 'pending',
    priority: 'medium',
    dueDate: '',
    projectId: '',
  });

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    // Verificar se há parâmetro de projeto na URL
    const urlParams = new URLSearchParams(window.location.search);
    const projectParam = urlParams.get('project');
    if (projectParam) {
      setFilters(prev => ({ ...prev, project: projectParam }));
    }
  }, []);

  const loadData = async () => {
    try {
      setLoading(true);
      setError(null);
      
      const projectsRes = await projectService.getProjects();
      setProjects(projectsRes.data);
      
      // Carregar todas as tarefas de todos os projetos
      const allTasks = [];
      for (const project of projectsRes.data) {
        try {
          const tasksRes = await projectService.getProjectTasks(project.id);
          const projectTasks = tasksRes.data.map(task => ({
            ...task,
            projectName: project.name,
            projectId: project.id,
          }));
          allTasks.push(...projectTasks);
        } catch (err) {
          console.error(`Erro ao carregar tarefas do projeto ${project.id}:`, err);
        }
      }
      
      setTasks(allTasks);
      
    } catch (err) {
      console.error('Erro ao carregar dados:', err);
      setError('Erro ao carregar tarefas');
    } finally {
      setLoading(false);
    }
  };

  const handleOpenDialog = (task = null) => {
    if (task) {
      setEditingTask(task);
      setFormData({
        title: task.title,
        description: task.description || '',
        status: task.status,
        priority: task.priority,
        dueDate: task.dueDate ? task.dueDate.split('T')[0] : '',
        projectId: task.projectId,
      });
    } else {
      setEditingTask(null);
      setFormData({
        title: '',
        description: '',
        status: 'pending',
        priority: 'medium',
        dueDate: '',
        projectId: filters.project !== 'all' ? filters.project : '',
      });
    }
    setOpenDialog(true);
  };

  const handleCloseDialog = () => {
    setOpenDialog(false);
    setEditingTask(null);
    setFormData({
      title: '',
      description: '',
      status: 'pending',
      priority: 'medium',
      dueDate: '',
      projectId: '',
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
      if (!formData.title.trim()) {
        showSnackbar('Título da tarefa é obrigatório', 'error');
        return;
      }

      if (!formData.projectId) {
        showSnackbar('Projeto é obrigatório', 'error');
        return;
      }

      const dataToSend = {
        ...formData,
        dueDate: formData.dueDate || null,
      };

      if (editingTask) {
        await taskService.updateTask(editingTask.id, dataToSend);
        showSnackbar('Tarefa atualizada com sucesso!', 'success');
      } else {
        await projectService.createProjectTask(formData.projectId, dataToSend);
        showSnackbar('Tarefa criada com sucesso!', 'success');
      }

      handleCloseDialog();
      loadData();
    } catch (err) {
      console.error('Erro ao salvar tarefa:', err);
      showSnackbar('Erro ao salvar tarefa', 'error');
    }
  };

  const handleDelete = async (taskId) => {
    if (window.confirm('Tem certeza que deseja excluir esta tarefa?')) {
      try {
        await taskService.deleteTask(taskId);
        showSnackbar('Tarefa excluída com sucesso!', 'success');
        loadData();
      } catch (err) {
        console.error('Erro ao excluir tarefa:', err);
        showSnackbar('Erro ao excluir tarefa', 'error');
      }
    }
  };

  const handleStatusChange = async (taskId, newStatus) => {
    try {
      await taskService.updateTask(taskId, { status: newStatus });
      showSnackbar('Status atualizado!', 'success');
      loadData();
    } catch (err) {
      console.error('Erro ao atualizar status:', err);
      showSnackbar('Erro ao atualizar status', 'error');
    }
  };

  const showSnackbar = (message, severity) => {
    setSnackbar({ open: true, message, severity });
  };

  const handleCloseSnackbar = () => {
    setSnackbar({ ...snackbar, open: false });
  };

  const handleFilterChange = (filterType) => (event, newValue) => {
    if (newValue !== null) {
      setFilters({
        ...filters,
        [filterType]: newValue,
      });
    }
  };

  const getFilteredTasks = () => {
    return tasks.filter(task => {
      if (filters.status !== 'all' && task.status !== filters.status) return false;
      if (filters.priority !== 'all' && task.priority !== filters.priority) return false;
      if (filters.project !== 'all' && task.projectId.toString() !== filters.project) return false;
      return true;
    });
  };

  const getStatusIcon = (status) => {
    switch (status) {
      case 'completed': return <CheckCircle color="success" />;
      case 'in_progress': return <PlayCircle color="warning" />;
      case 'pending': return <Schedule color="action" />;
      default: return <Task />;
    }
  };

  const getStatusColor = (status) => {
    switch (status) {
      case 'completed': return 'success';
      case 'in_progress': return 'warning';
      case 'pending': return 'default';
      default: return 'default';
    }
  };

  const getStatusLabel = (status) => {
    switch (status) {
      case 'completed': return 'Concluída';
      case 'in_progress': return 'Em Progresso';
      case 'pending': return 'Pendente';
      default: return status;
    }
  };

  const getPriorityColor = (priority) => {
    switch (priority) {
      case 'high': return 'error';
      case 'medium': return 'warning';
      case 'low': return 'success';
      default: return 'default';
    }
  };

  const getPriorityLabel = (priority) => {
    switch (priority) {
      case 'high': return 'Alta';
      case 'medium': return 'Média';
      case 'low': return 'Baixa';
      default: return priority;
    }
  };

  const formatDate = (dateString) => {
    if (!dateString) return null;
    const date = new Date(dateString);
    return date.toLocaleDateString('pt-BR');
  };

  const isOverdue = (dueDate) => {
    if (!dueDate) return false;
    const today = new Date();
    const due = new Date(dueDate);
    return due < today;
  };

  const filteredTasks = getFilteredTasks();

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
            Tarefas
          </Typography>
          <Typography variant="body1" color="text.secondary">
            Gerencie suas tarefas e acompanhe o progresso dos projetos.
          </Typography>
        </Box>
      </Box>

      {/* Filtros */}
      <Paper sx={{ p: 3, mb: 4 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
          <FilterList sx={{ mr: 1 }} />
          <Typography variant="h6">Filtros</Typography>
        </Box>
        
        <Grid container spacing={3}>
          <Grid item xs={12} md={4}>
            <Typography variant="body2" sx={{ mb: 1 }}>Status</Typography>
            <ToggleButtonGroup
              value={filters.status}
              exclusive
              onChange={handleFilterChange('status')}
              size="small"
              fullWidth
            >
              <ToggleButton value="all">Todos</ToggleButton>
              <ToggleButton value="pending">Pendentes</ToggleButton>
              <ToggleButton value="in_progress">Em Progresso</ToggleButton>
              <ToggleButton value="completed">Concluídas</ToggleButton>
            </ToggleButtonGroup>
          </Grid>

          <Grid item xs={12} md={4}>
            <Typography variant="body2" sx={{ mb: 1 }}>Prioridade</Typography>
            <ToggleButtonGroup
              value={filters.priority}
              exclusive
              onChange={handleFilterChange('priority')}
              size="small"
              fullWidth
            >
              <ToggleButton value="all">Todas</ToggleButton>
              <ToggleButton value="low">Baixa</ToggleButton>
              <ToggleButton value="medium">Média</ToggleButton>
              <ToggleButton value="high">Alta</ToggleButton>
            </ToggleButtonGroup>
          </Grid>

          <Grid item xs={12} md={4}>
            <FormControl fullWidth size="small">
              <InputLabel>Projeto</InputLabel>
              <Select
                value={filters.project}
                onChange={(e) => setFilters({ ...filters, project: e.target.value })}
                label="Projeto"
              >
                <MenuItem value="all">Todos os projetos</MenuItem>
                {projects.map((project) => (
                  <MenuItem key={project.id} value={project.id.toString()}>
                    {project.name}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
        </Grid>
      </Paper>

      {/* Grid de Tarefas */}
      {filteredTasks.length === 0 ? (
        <Box sx={{ textAlign: 'center', py: 8 }}>
          <Task sx={{ fontSize: 64, color: 'text.secondary', mb: 2 }} />
          <Typography variant="h6" color="text.secondary" gutterBottom>
            {tasks.length === 0 ? 'Nenhuma tarefa encontrada' : 'Nenhuma tarefa corresponde aos filtros'}
          </Typography>
          <Typography variant="body2" color="text.secondary" sx={{ mb: 3 }}>
            {tasks.length === 0 
              ? 'Crie sua primeira tarefa para começar a organizar seu trabalho.'
              : 'Tente ajustar os filtros para ver mais tarefas.'
            }
          </Typography>
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => handleOpenDialog()}
          >
            Criar Tarefa
          </Button>
        </Box>
      ) : (
        <Grid container spacing={3}>
          {filteredTasks.map((task) => (
            <Grid item xs={12} sm={6} md={4} key={task.id}>
              <Card
                sx={{
                  height: '100%',
                  display: 'flex',
                  flexDirection: 'column',
                  '&:hover': {
                    boxShadow: 6,
                  },
                  borderLeft: task.priority === 'high' ? '4px solid #f44336' : 
                           task.priority === 'medium' ? '4px solid #ff9800' : '4px solid #4caf50',
                }}
              >
                <CardContent sx={{ flexGrow: 1 }}>
                  <Box sx={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', mb: 2 }}>
                    <Typography variant="h6" component="h2" sx={{ flexGrow: 1 }}>
                      {task.title}
                    </Typography>
                    <Avatar sx={{ width: 32, height: 32, ml: 1 }}>
                      {getStatusIcon(task.status)}
                    </Avatar>
                  </Box>
                  
                  {task.description && (
                    <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
                      {task.description}
                    </Typography>
                  )}

                  {/* Informações do Projeto */}
                  <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
                    <Assignment sx={{ fontSize: 16, mr: 0.5, color: 'text.secondary' }} />
                    <Typography variant="caption" color="text.secondary">
                      {task.projectName}
                    </Typography>
                  </Box>

                  {/* Data de Vencimento */}
                  {task.dueDate && (
                    <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
                      <Event sx={{ fontSize: 16, mr: 0.5, color: isOverdue(task.dueDate) ? 'error.main' : 'text.secondary' }} />
                      <Typography 
                        variant="caption" 
                        color={isOverdue(task.dueDate) ? 'error.main' : 'text.secondary'}
                      >
                        {formatDate(task.dueDate)}
                        {isOverdue(task.dueDate) && ' (Atrasada)'}
                      </Typography>
                    </Box>
                  )}

                  {/* Chips de Status e Prioridade */}
                  <Box sx={{ display: 'flex', gap: 1, flexWrap: 'wrap' }}>
                    <Chip
                      label={getStatusLabel(task.status)}
                      color={getStatusColor(task.status)}
                      size="small"
                      icon={getStatusIcon(task.status)}
                    />
                    <Chip
                      label={getPriorityLabel(task.priority)}
                      color={getPriorityColor(task.priority)}
                      size="small"
                      variant="outlined"
                      icon={<PriorityHigh />}
                    />
                  </Box>
                </CardContent>

                <CardActions sx={{ justifyContent: 'space-between', px: 2, pb: 2 }}>
                  {/* Botões de Status */}
                  <Box sx={{ display: 'flex', gap: 0.5 }}>
                    {task.status !== 'pending' && (
                      <Button
                        size="small"
                        onClick={() => handleStatusChange(task.id, 'pending')}
                        variant="outlined"
                        color="inherit"
                      >
                        Pendente
                      </Button>
                    )}
                    {task.status !== 'in_progress' && (
                      <Button
                        size="small"
                        onClick={() => handleStatusChange(task.id, 'in_progress')}
                        variant="outlined"
                        color="warning"
                      >
                        Progresso
                      </Button>
                    )}
                    {task.status !== 'completed' && (
                      <Button
                        size="small"
                        onClick={() => handleStatusChange(task.id, 'completed')}
                        variant="outlined"
                        color="success"
                      >
                        Concluir
                      </Button>
                    )}
                  </Box>

                  {/* Ações */}
                  <Box>
                    <IconButton
                      size="small"
                      onClick={() => handleOpenDialog(task)}
                      color="primary"
                    >
                      <Edit />
                    </IconButton>
                    <IconButton
                      size="small"
                      onClick={() => handleDelete(task.id)}
                      color="error"
                    >
                      <Delete />
                    </IconButton>
                  </Box>
                </CardActions>
              </Card>
            </Grid>
          ))}
        </Grid>
      )}

      {/* FAB para criar nova tarefa */}
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

      {/* Dialog para criar/editar tarefa */}
      <Dialog open={openDialog} onClose={handleCloseDialog} maxWidth="sm" fullWidth>
        <DialogTitle>
          <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            {editingTask ? 'Editar Tarefa' : 'Nova Tarefa'}
            <IconButton onClick={handleCloseDialog}>
              <Close />
            </IconButton>
          </Box>
        </DialogTitle>
        
        <DialogContent>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 3, mt: 1 }}>
            <TextField
              label="Título"
              value={formData.title}
              onChange={handleInputChange('title')}
              fullWidth
              required
              placeholder="Digite o título da tarefa"
            />

            <TextField
              label="Descrição"
              value={formData.description}
              onChange={handleInputChange('description')}
              fullWidth
              multiline
              rows={3}
              placeholder="Descrição opcional da tarefa"
            />

            <FormControl fullWidth required>
              <InputLabel>Projeto</InputLabel>
              <Select
                value={formData.projectId}
                onChange={handleInputChange('projectId')}
                label="Projeto"
              >
                {projects.map((project) => (
                  <MenuItem key={project.id} value={project.id}>
                    {project.name}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>

            <Grid container spacing={2}>
              <Grid item xs={6}>
                <FormControl fullWidth>
                  <InputLabel>Status</InputLabel>
                  <Select
                    value={formData.status}
                    onChange={handleInputChange('status')}
                    label="Status"
                  >
                    <MenuItem value="pending">Pendente</MenuItem>
                    <MenuItem value="in_progress">Em Progresso</MenuItem>
                    <MenuItem value="completed">Concluída</MenuItem>
                  </Select>
                </FormControl>
              </Grid>

              <Grid item xs={6}>
                <FormControl fullWidth>
                  <InputLabel>Prioridade</InputLabel>
                  <Select
                    value={formData.priority}
                    onChange={handleInputChange('priority')}
                    label="Prioridade"
                  >
                    <MenuItem value="low">Baixa</MenuItem>
                    <MenuItem value="medium">Média</MenuItem>
                    <MenuItem value="high">Alta</MenuItem>
                  </Select>
                </FormControl>
              </Grid>
            </Grid>

            <TextField
              label="Data de Vencimento"
              type="date"
              value={formData.dueDate}
              onChange={handleInputChange('dueDate')}
              fullWidth
              InputLabelProps={{
                shrink: true,
              }}
            />
          </Box>
        </DialogContent>

        <DialogActions>
          <Button onClick={handleCloseDialog}>
            Cancelar
          </Button>
          <Button onClick={handleSubmit} variant="contained">
            {editingTask ? 'Atualizar' : 'Criar'}
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

export default Tasks;