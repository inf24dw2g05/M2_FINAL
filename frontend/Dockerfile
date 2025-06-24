# Dockerfile para o Frontend React
FROM node:18-alpine as build

# Definir diretório de trabalho
WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar código fonte
COPY . .

# Copiar arquivo de ambiente de produção
COPY .env.production .env

# Build da aplicação para produção
RUN npm run build

# Estágio de produção com Nginx
FROM nginx:alpine

# Copiar build do React para Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Copiar configuração customizada do Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expor porta 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]