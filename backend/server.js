require('dotenv').config();
const express = require('express');
const session = require('express-session');
const passport = require('passport');
const cors = require('cors');
const path = require('path');

console.log('Iniciando servidor...'); // Log para debug

// Verificar variáveis de ambiente
console.log('Variáveis de ambiente carregadas:');
console.log('PORT:', process.env.PORT);
console.log('DB_HOST:', process.env.DB_HOST);
console.log('DB_NAME:', process.env.DB_NAME);
console.log('GOOGLE_CLIENT_ID:', process.env.GOOGLE_CLIENT_ID ? 'Definido' : 'Não definido');

const app = express();

app.use((req, res, next) => {
  console.log(`\n=== Nova Requisição ===`);
  console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
  console.log('======================\n');
  next();
});

// Importar com tratamento de erro
let sequelize, syncDatabase;
try {
  const models = require('./models');
  sequelize = models.sequelize;
  syncDatabase = models.syncDatabase;
  console.log('Models carregados com sucesso');
} catch (error) {
  console.error('Erro ao carregar models:', error);
  process.exit(1);
}

let handleError;
try {
  handleError = require('./middleware/errorHandler').handleError;
  console.log('Error handler carregado com sucesso');
} catch (error) {
  console.error('Erro ao carregar error handler:', error);
  handleError = (err, req, res, next) => {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  };
}

// Middleware
app.use(cors({
  origin: 'http://localhost:3001',
  credentials: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Configurar sessão
app.use(session({
  secret: process.env.SESSION_SECRET || 'secret-key-default',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: process.env.NODE_ENV === 'production',
    maxAge: 24 * 60 * 60 * 1000
  }
}));

// Inicializar Passport
app.use(passport.initialize());
app.use(passport.session());

try {
  require('./config/passport')(passport);
  console.log('Passport configurado com sucesso');
} catch (error) {
  console.error('Erro ao configurar passport:', error);
}

// Logging de requisições
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
  if (req.user) {
    console.log(`Usuário autenticado: ${req.user.email} (ID: ${req.user.id})`);
  }
  next();
});

// Swagger UI
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');

try {
  const swaggerDocument = YAML.load('./docs/openapi.yaml');
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
  console.log('Swagger configurado com sucesso');
} catch (error) {
  console.error('Erro ao configurar Swagger:', error);
}

// Rotas principais
app.get('/', (req, res) => {
  if (req.isAuthenticated()) {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
  } else {
    res.redirect('/login');
  }
});

app.get('/login', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

// Rotas da API
try {
  const routes = require('./routes');
  app.use('/api', routes);
  console.log('Rotas carregadas com sucesso');
} catch (error) {
  console.error('Erro ao carregar rotas:', error);
}

// Tratamento de erros
app.use(handleError);

// 404 handler
app.use((req, res) => {
  res.status(404).json({ error: 'Rota não encontrada' });
});

// Iniciar servidor
const PORT = process.env.PORT || 3000;

async function startServer() {
  try {
    console.log('Testando conexão com banco de dados...');
    await sequelize.authenticate();
    console.log('Conexão com banco de dados estabelecida!');

    console.log('Sincronizando modelos...');
    await syncDatabase();
    console.log('Modelos sincronizados!');

    app.listen(PORT, () => {
      console.log(`Servidor rodando em http://localhost:${PORT}`);
      console.log(`Documentação da API disponível em http://localhost:${PORT}/api-docs`);
    });
  } catch (error) {
    console.error('Erro ao iniciar servidor:', error);
    process.exit(1);
  }
}

// Tratamento de erros não capturados
process.on('uncaughtException', (error) => {
  console.error('Erro não capturado:', error);
  process.exit(1);
});

process.on('unhandledRejection', (reason, promise) => {
  console.error('Promise rejeitada não tratada:', reason);
  process.exit(1);
});

console.log('Iniciando aplicação...');
startServer();