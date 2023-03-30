# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the necessary files
COPY package*.json ./
COPY angular.json ./
COPY tsconfig*.json ./
COPY src/ ./src/

# Install dependencies
RUN npm install

# Build the application
RUN npm run build --prod

# Create a new image using nginx as the base image
FROM nginx:alpine

# Copy the files from the builder stage to the nginx directory
COPY /app/dist/crudtuto-Front /usr/share/nginx/html

# Expose port 80 for external access
EXPOSE 80

# Start nginx to serve the application
CMD ["nginx", "-g", "daemon off;"]
