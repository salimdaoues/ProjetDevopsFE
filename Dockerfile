# FROM node:latest AS build
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod

# FROM nginx:latest
# COPY --from=build /app/dist/crud-tuto-front /usr/share/nginx/html
FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build

FROM nginx:latest
COPY --from=0 /app/dist/crud-tuto-front /usr/share/nginx/html
