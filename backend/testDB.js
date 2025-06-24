require('dotenv').config();

async function testConnection() {
  try {
    // Aguardar um pouco para garantir que o banco foi criado
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    const sequelize = require('./config/database');
    
    await sequelize.authenticate();
    console.log('Conexão com o banco de dados estabelecida com sucesso!');
    
    // Sincronizar os modelos (criar tabelas)
    const { syncDatabase } = require('./models');
    await syncDatabase();
    
    console.log('Tabelas criadas com sucesso!');
    process.exit(0);
  } catch (error) {
    console.error('Erro ao conectar ao banco de dados:', error);
    process.exit(1);
  }
}

testConnection();