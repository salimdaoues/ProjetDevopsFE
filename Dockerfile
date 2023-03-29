# FROM node:latest AS build
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod

# FROM nginx:latest
# COPY --from=build /app/dist/crud-tuto-front /usr/share/nginx/html
# FROM node:latest
# WORKDIR /app
# COPY . .
# RUN npm install --legacy-peer-deps
# RUN npm run build --prod
# FROM nginx:latest
# COPY --from=0 /app/dist/crud-tuto-front /usr/share/nginx/html

FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install --legacy-peer-deps
COPY . /app
RUN npm run build --prod
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/dist/crud-tuto-front /usr/share/nginx/html