import React from 'react';
import {
  Container,
  Paper,
  Box,
  Typography,
  Button,
  Avatar,
} from '@mui/material';
import { Google } from '@mui/icons-material';
import { useAuth } from '../hooks/useAuth';

const Login = () => {
  const { login } = useAuth();

  return (
    <Container component="main" maxWidth="sm">
      <Box
        sx={{
          marginTop: 8,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
        }}
      >
        <Paper elevation={3} sx={{ padding: 4, width: '100%' }}>
          <Box
            sx={{
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
            }}
          >
            <Avatar sx={{ m: 1, bgcolor: 'primary.main' }}>
              <Google />
            </Avatar>
            
            <Typography component="h1" variant="h4" gutterBottom>
              Task Manager
            </Typography>
            
            <Typography variant="body1" color="text.secondary" align="center" sx={{ mb: 3 }}>
              Faça login para gerenciar seus projetos e tarefas
            </Typography>

            <Button
              fullWidth
              variant="contained"
              size="large"
              startIcon={<Google />}
              onClick={login}
              sx={{
                mt: 2,
                py: 2,
                fontSize: '1.1rem',
                background: 'linear-gradient(45deg, #4285f4 30%, #34a853 90%)',
                '&:hover': {
                  background: 'linear-gradient(45deg, #3367d6 30%, #2e7d32 90%)',
                },
              }}
            >
              Entrar com Google
            </Button>

            <Typography variant="body2" color="text.secondary" align="center" sx={{ mt: 3 }}>
              Seguro e rápido com OAuth2
            </Typography>
          </Box>
        </Paper>
      </Box>
    </Container>
  );
};

export default Login;