# Desenvolvimento Web 2 - Trabalho Prático
## Task Manager - Aplicação Web Cliente

**Disciplina:** Desenvolvimento Web 2  
**Ano Letivo:** 2024/2025  
**Grupo:** inf24dw2g05  
**Integrantes:**
- Nuno Pereira
- Rodrigo Pereira

---

## Índice

1. [Introdução](#introdução)
2. [Arquitetura da Aplicação](#arquitetura-da-aplicação)
3. [Funcionalidades Implementadas](#funcionalidades-implementadas)
4. [Tecnologias Utilizadas](#tecnologias-utilizadas)
5. [Estrutura do Projeto](#estrutura-do-projeto)
6. [Autenticação e Autorização](#autenticação-e-autorização)
7. [Interface de Utilizador](#interface-de-utilizador)
8. [Configuração e Deployment](#configuração-e-deployment)

---

## Introdução

Este relatório documenta o desenvolvimento de uma aplicação web cliente para gestão de tarefas e projetos, desenvolvida em React.js como parte do trabalho prático da disciplina de Desenvolvimento Web 2.

### Objetivos

- Desenvolver uma aplicação web cliente moderna utilizando React.js
- Implementar interface responsiva e intuitiva para gestão de projetos e tarefas
- Integrar com API REST protegida por autenticação OAuth2
- Implementar funcionalidades CRUD completas
- Utilizar containerização com Docker para deployment

### Âmbito

A aplicação **Task Manager** permite aos utilizadores:
- Autenticar-se via Google OAuth2
- Gerir categorias de projetos
- Criar e gerir projetos
- Criar e gerir tarefas associadas a projetos
- Visualizar dashboard com estatísticas e progresso
- Filtrar e organizar tarefas por status, prioridade e projeto

---

## Arquitetura da Aplicação

### Arquitetura Geral

A aplicação segue uma arquitetura **SPA (Single Page Application)** baseada em React.js, comunicando com uma API REST através de requisições AJAX.

```
┌─────────────────┐    HTTP/HTTPS    ┌─────────────────┐
│   React Client  │ ←──────────────→ │   API REST      │
│   (Frontend)    │                  │   (Backend)     │
└─────────────────┘                  └─────────────────┘
         │                                    │
         │                                    │
         ▼                                    ▼
┌─────────────────┐                  ┌─────────────────┐
│     Nginx       │                  │   Base de Dados │
│   (Proxy/Web)   │                  │     MySQL       │
└─────────────────┘                  └─────────────────┘
```

### Componentes Principais

#### Frontend (React.js)
- **Components**: Componentes reutilizáveis da interface
- **Pages**: Páginas principais da aplicação
- **Services**: Camada de comunicação com a API
- **Hooks**: Hooks customizados para gestão de estado
- **Routing**: Navegação entre páginas

#### Infraestrutura
- **Docker**: Containerização da aplicação
- **Nginx**: Servidor web e proxy reverso
- **Environment Variables**: Configuração de ambientes

---

## Funcionalidades Implementadas

### 1. Autenticação e Autorização

#### Google OAuth2 Integration
- Login seguro através do Google
- Gestão de sessões com cookies
- Proteção de rotas privadas
- Logout com limpeza de sessão

```javascript
// Exemplo de autenticação
const authService = {
    getAuthStatus: () => api.get('/auth/status'),
    loginGoogle: () => {
        const baseUrl = process.env.REACT_APP_API_URL || '';
        window.location.href = `${baseUrl}/auth/google`;
    },
    logout: () => api.get('/auth/logout'),
};
```

### 2. Dashboard

#### Visão Geral do Sistema
- Estatísticas gerais (projetos, categorias, tarefas)
- Gráficos de progresso das tarefas
- Lista de projetos recentes
- Distribuição de tarefas por status

#### Métricas Apresentadas
- Total de projetos criados
- Total de categorias disponíveis
- Total de tarefas e distribuição por status
- Percentagem de conclusão geral

### 3. Gestão de Categorias

#### Funcionalidades CRUD
- **Create**: Criação de novas categorias com nome, cor e descrição
- **Read**: Listagem de todas as categorias
- **Update**: Edição de categorias existentes
- **Delete**: Remoção de categorias

#### Interface
- Cards visuais com cores personalizadas
- Seletor de cores integrado
- Formulários modais para criação/edição
- Confirmação para exclusão

### 4. Gestão de Projetos

#### Funcionalidades Principais
- Criação de projetos com associação a categorias
- Visualização de projetos em cards informativos
- Estatísticas de tarefas por projeto
- Barra de progresso visual

#### Informações Apresentadas
- Nome e descrição do projeto
- Categoria associada (com cor)
- Número de tarefas por status
- Percentagem de conclusão
- Navegação direta para tarefas do projeto

### 5. Gestão de Tarefas

#### Sistema Completo de Tarefas
- Criação de tarefas associadas a projetos
- Três estados: Pendente, Em Progresso, Concluída
- Três níveis de prioridade: Baixa, Média, Alta
- Data de vencimento opcional
- Marcação visual de tarefas atrasadas

#### Sistema de Filtros
- Filtro por status das tarefas
- Filtro por prioridade
- Filtro por projeto
- Botões de toggle para facilitar navegação

#### Ações Rápidas
- Mudança rápida de status com botões dedicados
- Edição inline de tarefas
- Exclusão com confirmação
- Indicadores visuais de prioridade

---

## Tecnologias Utilizadas

### Frontend

#### React.js Ecosystem
- **React 18.2.0**: Biblioteca principal
- **React Router DOM 6.15.0**: Roteamento SPA
- **React Scripts 5.0.1**: Build tools e desenvolvimento

#### UI Framework
- **Material-UI (MUI) 5.14.0**: Framework de componentes
- **@mui/icons-material**: Ícones padronizados
- **@emotion/react & @emotion/styled**: Sistema de estilos

#### HTTP Client
- **Axios 1.4.0**: Cliente HTTP para comunicação com API
- Interceptors para logging e tratamento de erros
- Configuração de timeout e credentials

#### Fontes e Recursos
- **@fontsource/roboto**: Fonte tipográfica padrão

### Build e Deployment

#### Docker
- **Multi-stage build**: Otimização de imagem
- **Node.js 18-alpine**: Imagem base para build
- **Nginx Alpine**: Servidor web de produção

#### Nginx Configuration
- Proxy reverso para API
- Configuração SPA para React Router
- Cache de assets estáticos
- Headers de segurança

---

## Estrutura do Projeto

### Organização de Diretórios

```
task-manager-frontend/
├── public/
│   ├── index.html
│   ├── favicon.ico
│   └── manifest.json
├── src/
│   ├── components/
│   │   └── Navbar.js
│   ├── pages/
│   │   ├── Dashboard.js
│   │   ├── Login.js
│   │   ├── Projects.js
│   │   ├── Tasks.js
│   │   └── Categories.js
│   ├── services/
│   │   └── api.js
│   ├── hooks/
│   │   └── useAuth.js
│   └── App.js
├── docker/
│   ├── Dockerfile
│   └── nginx.conf
├── .env
├── .env.production
├── package.json
└── README.md
```

### Componentes Principais

#### 1. API Service Layer (`api.js`)
```javascript
// Configuração centralizada da API
const api = axios.create({
  baseURL: process.env.REACT_APP_API_URL || '/api',
  timeout: 10000,
  withCredentials: true,
});

// Serviços organizados por domínio
export const authService = { /* ... */ };
export const projectService = { /* ... */ };
export const categoryService = { /* ... */ };
export const taskService = { /* ... */ };
```

#### 2. Hook de Autenticação (`useAuth.js`)
```javascript
// Context para gestão global de autenticação
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [authenticated, setAuthenticated] = useState(false);
  const [loading, setLoading] = useState(true);
  
  // Métodos de autenticação
  // ...
};
```

#### 3. Componentes de Página
- **Dashboard**: Visão geral e estatísticas
- **Login**: Autenticação OAuth2
- **Projects**: CRUD de projetos
- **Tasks**: CRUD de tarefas com filtros
- **Categories**: CRUD de categorias

---

## Autenticação e Autorização

### Fluxo OAuth2 com Google

1. **Redirecionamento para Google**
   ```javascript
   loginGoogle: () => {
       const baseUrl = process.env.REACT_APP_API_URL || '';
       window.location.href = `${baseUrl}/auth/google`;
   }
   ```

2. **Callback e Estabelecimento de Sessão**
   - API processa callback do Google
   - Cria sessão segura com cookies
   - Redireciona para aplicação principal

3. **Verificação de Status**
   ```javascript
   const checkAuthStatus = async () => {
       const response = await authService.getAuthStatus();
       if (response.data.authenticated) {
           setUser(response.data.user);
           setAuthenticated(true);
       }
   };
   ```

### Proteção de Rotas

- Verificação automática de autenticação no carregamento
- Redirecionamento para login em caso de falha
- Interceptor axios para captura de 401 Unauthorized

### Gestão de Sessão

- Cookies httpOnly para segurança
- Timeout automático de sessão
- Logout com limpeza completa de estado

---

## Interface de Utilizador

### Design System

#### Material Design 3
- Componentes padronizados do Material-UI
- Tema consistente com cores primárias/secundárias
- Responsividade automática com Grid System
- Elevação e sombras para hierarquia visual

#### Navegação
- **AppBar fixa** com navegação principal
- **Bottom Navigation** em dispositivos móveis
- **FABs** para ações primárias

### Experiência do Utilizador

#### Feedback Visual
- **Snackbars** para notificações de sucesso/erro
- **Loading states** com CircularProgress
- **Confirmações** para ações destrutivas

#### Interações
- **Hover effects** em cards e botões
- **Transition animations** suaves
- **Tooltips** para explicações adicionais

### Responsividade

#### Breakpoints Material-UI
- **xs**: < 600px (mobile)
- **sm**: 600px - 960px (tablet)
- **md**: 960px - 1280px (laptop)
- **lg**: 1280px - 1920px (desktop)
- **xl**: > 1920px (large screens)

#### Adaptações
- Grid flexível com diferentes colunas por breakpoint
- Navegação adaptativa (drawer em mobile)
- Formulários otimizados para touch
- Cards redimensionáveis automaticamente

---

## Configuração e Deployment

### Docker Multi-stage Build

#### Stage 1: Build da Aplicação
```dockerfile
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
COPY .env.production .env
RUN npm run build
```

#### Stage 2: Nginx Production
```dockerfile
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Configuração Nginx

#### Proxy para API
```nginx
location /api/ {
    proxy_pass http://app:3000/api/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

#### SPA Routing
```nginx
location / {
    try_files $uri $uri/ /index.html;
}
```

#### Cache de Assets
```nginx
location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

### Variables de Ambiente

#### Desenvolvimento (`.env`)
```env
REACT_APP_API_URL=http://localhost:3000/api
```

#### Produção (`.env.production`)
```env
REACT_APP_API_URL=/api
```

### Build e Deploy Process

1. **Development Build**
   ```bash
   npm start
   # Servidor de desenvolvimento em http://localhost:3000
   ```

2. **Production Build**
   ```bash
   npm run build
   # Gera pasta /build otimizada
   ```

3. **Docker Build**
   ```bash
   docker build -t task-manager-frontend .
   ```

4. **Docker Run**
   ```bash
   docker run -p 80:80 task-manager-frontend
   ```

---

**Grupo:** inf24dw2g05  
**Data:** Janeiro 2025  
**Versão:** 1.0