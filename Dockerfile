# # FROM node:14
# # WORKDIR /app
# # COPY package*.json ./
# # RUN npm install --legacy-peer-deps
# # COPY . .
# # RUN npm run build

# # FROM nginx:alpine
# # COPY /dist/crudtuto-Front /usr/share/nginx/html

# # Utiliser l'image de base Node.js
# FROM node:14

# # Définir le répertoire de travail
# WORKDIR /app

# # Copier les fichiers nécessaires
# COPY package*.json ./
# COPY angular.json ./
# COPY tsconfig*.json ./
# COPY src/ ./src/

# # Installer les dépendances
# RUN npm install

# # Construire l'application
# RUN npm run build --prod

# # Créer une nouvelle image à partir de l'image nginx
# FROM nginx:alpine

# # Copier les fichiers de l'application dans le répertoire de travail de nginx
# COPY /dist/crudtuto-Front /usr/share/nginx/html/

# # Exposer le port 4200 pour pouvoir accéder à l'application depuis l'extérieur
# EXPOSE 4200

# # Démarrer nginx pour servir l'application
# CMD ["nginx", "-g", "daemon off;"]
# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages
RUN npm install

# Make port 4200 available to the world outside this container
EXPOSE 4200

# Define environment variable
ENV BACKEND_URL=http://tp-achat-app:8089/api

# Run the command to start the app
CMD ["npm", "start"]
