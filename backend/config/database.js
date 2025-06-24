const { Sequelize } = require('sequelize');
const mysql = require('mysql2/promise');
require('dotenv').config();

// Função para criar o banco de dados se não existir com retry
async function createDatabaseIfNotExists(maxRetries = 5, delay = 5000) {
  let retries = 0;

  while (retries < maxRetries) {
    try {
      // Conectar ao MySQL sem especificar um banco de dados
      console.log(`Tentativa ${retries + 1}/${maxRetries} de conexão ao MySQL...`);
      const connection = await mysql.createConnection({
        host: process.env.DB_HOST,
        port: process.env.DB_PORT || 3306,  // ← ADICIONAR ESTA LINHA
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD
      });

      // Criar o banco de dados se não existir
      await connection.query(`CREATE DATABASE IF NOT EXISTS ${process.env.DB_NAME};`);
      console.log(`Database ${process.env.DB_NAME} está pronto!`);

      await connection.end();
      return; // Sucesso, sair da função
    } catch (error) {
      retries++;
      console.error(`Tentativa ${retries}/${maxRetries} falhou:`, error.message);

      if (retries >= maxRetries) {
        console.error('Número máximo de tentativas excedido. Desistindo.');
        throw error; // Repassar o erro após esgotar as tentativas
      }

      console.log(`Tentando novamente em ${delay / 1000} segundos...`);
      await new Promise(resolve => setTimeout(resolve, delay));
    }
  }
}

// Criar a conexão Sequelize
const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    //port:3308,
    port: process.env.DB_PORT || 3306,  // ← NOVA LINHA
    dialect: 'mysql',
    logging: false,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
  }

);

// Inicializar a conexão com retry
async function initializeConnection(maxRetries = 5, delay = 5000) {
  try {
    // Primeiro, garantir que o banco de dados existe
    await createDatabaseIfNotExists();

    // Tentar conectar com retry
    let retries = 0;
    while (retries < maxRetries) {
      try {
        console.log(`Tentativa ${retries + 1}/${maxRetries} de estabelecer conexão Sequelize...`);
        await sequelize.authenticate();
        console.log('Conexão Sequelize estabelecida com sucesso!');
        return; // Sucesso, sair da função
      } catch (error) {
        retries++;
        console.error(`Tentativa ${retries}/${maxRetries} falhou:`, error.message);

        if (retries >= maxRetries) {
          console.error('Número máximo de tentativas excedido. Desistindo.');
          throw error; // Repassar o erro após esgotar as tentativas
        }

        console.log(`Tentando novamente em ${delay / 1000} segundos...`);
        await new Promise(resolve => setTimeout(resolve, delay));
      }
    }
  } catch (error) {
    console.error('Falha na inicialização do banco de dados:', error);
    // Não vamos fazer throw aqui, para não bloquear o carregamento da aplicação
    // Em vez disso, as tentativas de conexão falharão mais tarde quando realmente necessário
  }
}

// Iniciar o processo de inicialização em background
initializeConnection().catch(err => {
  console.error('Erro ao inicializar conexão:', err);
});

// Exportamos o objeto Sequelize diretamente, para compatibilidade com o código existente
module.exports = sequelize;