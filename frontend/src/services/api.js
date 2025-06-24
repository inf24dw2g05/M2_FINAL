
import axios from 'axios';

// Configuração base da API
const api = axios.create({
  baseURL: process.env.REACT_APP_API_URL || '/api',
  timeout: 10000,
  withCredentials: true, // Para cookies de sessão
});

// Interceptor para requests
api.interceptors.request.use(
    (config) => {
        console.log('Request:', config.method?.toUpperCase(), config.url);
        return config;
    },
    (error) => {
        console.error('Request Error:', error);
        return Promise.reject(error);
    }
);

// Interceptor para responses
api.interceptors.response.use(
    (response) => {
        console.log('Response:', response.status, response.config.url);
        return response;
    },
    (error) => {
        console.error('Response Error:', error.response?.status, error.response?.data);

        // Redirecionar para login se não autenticado
        if (error.response?.status === 401) {
            window.location.href = '/login';
        }

        return Promise.reject(error);
    }
);

// Serviços da API
export const authService = {
    // Obter status de autenticação
    getAuthStatus: () => api.get('/auth/status'),

    // Login Google
    loginGoogle: () => {
        const baseUrl = process.env.REACT_APP_API_URL || '';
        window.location.href = `${baseUrl}/auth/google`;
    },

    // Logout
    logout: () => api.get('/auth/logout'),
};

export const userService = {
    // Obter perfil do usuário atual
    getCurrentUser: () => api.get('/users/me'),

    // Atualizar perfil
    updateProfile: (data) => api.put('/users/me', data),
};

export const categoryService = {
    // Listar categorias
    getCategories: () => api.get('/categories'),

    // Obter categoria específica
    getCategory: (id) => api.get(`/categories/${id}`),

    // Criar categoria
    createCategory: (data) => api.post('/categories', data),

    // Atualizar categoria
    updateCategory: (id, data) => api.put(`/categories/${id}`, data),

    // Deletar categoria
    deleteCategory: (id) => api.delete(`/categories/${id}`),
};

export const projectService = {
    // Listar projetos
    getProjects: () => api.get('/projects'),

    // Obter projeto específico
    getProject: (id) => api.get(`/projects/${id}`),

    // Criar projeto
    createProject: (data) => api.post('/projects', data),

    // Atualizar projeto
    updateProject: (id, data) => api.put(`/projects/${id}`, data),

    // Deletar projeto
    deleteProject: (id) => api.delete(`/projects/${id}`),

    // Obter tarefas de um projeto
    getProjectTasks: (projectId) => api.get(`/projects/${projectId}/tasks`),

    // Criar tarefa em um projeto
    createProjectTask: (projectId, data) => api.post(`/projects/${projectId}/tasks`, data),
};

export const taskService = {
    // Obter tarefa específica
    getTask: (id) => api.get(`/tasks/${id}`),

    // Atualizar tarefa
    updateTask: (id, data) => api.put(`/tasks/${id}`, data),

    // Deletar tarefa
    deleteTask: (id) => api.delete(`/tasks/${id}`),
};

export default api;