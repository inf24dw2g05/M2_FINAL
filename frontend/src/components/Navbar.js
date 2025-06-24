import React from 'react';
import {
  AppBar,
  Toolbar,
  Typography,
  Button,
  Box,
  Avatar,
} from '@mui/material';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../hooks/useAuth';

const Navbar = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleNavigation = (path) => {
    navigate(path);
  };

  const handleLogout = () => {
    logout();
  };

  return (
    <AppBar position="fixed">
      <Toolbar>
        {/* Logo/Title */}
        <Typography 
          variant="h6" 
          sx={{ cursor: 'pointer' }}
          onClick={() => handleNavigation('/dashboard')}
        >
          Task Manager
        </Typography>

        {/* Navigation Menu */}
        <Box sx={{ flexGrow: 1, ml: 4 }}>
          <Button 
            color="inherit" 
            onClick={() => handleNavigation('/dashboard')}
          >
            Dashboard
          </Button>
          <Button 
            color="inherit" 
            onClick={() => handleNavigation('/categories')}
          >
            Categorias
          </Button>
          <Button 
            color="inherit" 
            onClick={() => handleNavigation('/projects')}
          >
            Projetos
          </Button>
          <Button 
            color="inherit" 
            onClick={() => handleNavigation('/tasks')}
          >
            Tarefas
          </Button>
        </Box>

        {/* User Info */}
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
          <Avatar 
            src={user?.avatar} 
            sx={{ width: 32, height: 32 }}
          >
            {user?.name?.charAt(0)}
          </Avatar>
          <Typography variant="body1">
            {user?.name}
          </Typography>
          <Button color="inherit" onClick={handleLogout}>
            Logout
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;