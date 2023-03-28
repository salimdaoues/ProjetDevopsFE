# FROM node:latest AS build
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod

# FROM nginx:latest
# COPY --from=build /app/dist/my-app /usr/share/nginx/html
FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
COPY --from=0 /app/dist/tp-achat-frontend /usr/share/nginx/html
