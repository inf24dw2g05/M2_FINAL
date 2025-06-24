const sequelize = require('../config/database');
const User = require('./User');
const Category = require('./Category');
const Project = require('./Project');
const Task = require('./Task');

// Definir relações
User.hasMany(Category, { foreignKey: 'userId' });
Category.belongsTo(User, { foreignKey: 'userId' });

User.hasMany(Project, { foreignKey: 'userId' });
Project.belongsTo(User, { foreignKey: 'userId' });

Category.hasMany(Project, { foreignKey: 'categoryId' });
Project.belongsTo(Category, { foreignKey: 'categoryId' });

Project.hasMany(Task, { foreignKey: 'projectId' });
Task.belongsTo(Project, { foreignKey: 'projectId' });

// Função para sincronizar o banco de dados
const syncDatabase = async () => {
  try {
    await sequelize.sync({ alter: true });
    console.log('Database synchronized successfully');
  } catch (error) {
    console.error('Error synchronizing database:', error);
  }
};

module.exports = {
  sequelize,
  User,
  Category,
  Project,
  Task,
  syncDatabase
};