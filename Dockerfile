# FROM node:latest AS build
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod

# FROM nginx:latest
# COPY --from=build /app/dist/crud-tuto-front /usr/share/nginx/html
FROM node:latest
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build --prod
FROM nginx:latest
COPY --from=0 /app/dist/crud-tuto-front /usr/share/nginx/html
