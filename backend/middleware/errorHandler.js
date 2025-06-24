module.exports = {
    handleError: (err, req, res, next) => {
      console.error(err.stack);
      
      if (err.message === 'User not authenticated') {
        return res.status(401).json({ error: 'Authentication required' });
      }
      
      if (err.message.includes('not found')) {
        return res.status(404).json({ error: err.message });
      }
      
      if (err.message.includes('access denied')) {
        return res.status(403).json({ error: err.message });
      }
      
      // Erro de validação do Sequelize
      if (err.name === 'SequelizeValidationError') {
        return res.status(400).json({ 
          error: 'Validation error',
          details: err.errors.map(e => e.message)
        });
      }
      
      // Erro genérico
      res.status(500).json({ error: 'Internal server error' });
    }
  };