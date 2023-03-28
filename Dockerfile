FROM node:latest AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:latest
COPY --from=build /app/dist/my-app /usr/share/nginx/html
