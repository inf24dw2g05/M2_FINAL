module.exports = {
    // Callback do Google
    googleCallback: (req, res) => {
    res.redirect('http://localhost:3001/dashboard');
    },
    // Logout
    logout: (req, res) => {
      req.logout((err) => {
        if (err) {
          console.error(err);
        }
        res.redirect('/login');
      });
    },
    
    // Status de autenticação
    getAuthStatus: (req, res) => {
      if (req.isAuthenticated()) {
        res.json({ 
          authenticated: true, 
          user: {
            id: req.user.id,
            name: req.user.name,
            email: req.user.email,
            avatar: req.user.avatar
          }
        });
      } else {
        res.json({ authenticated: false });
      }
    }
  };