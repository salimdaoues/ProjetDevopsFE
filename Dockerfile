# Utiliser l'image de base Node.js
FROM node:14

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY package*.json ./
COPY angular.json ./
COPY tsconfig*.json ./
COPY src/ ./src/

# Installer les dépendances
RUN npm install

COPY . .

CMD [ "node", "server.js" ]