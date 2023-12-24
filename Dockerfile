FROM node:latest-alpine as build

WORKDIR /app

COPY ./example-app-nodejs-backend-react-frontend/package.json ./
COPY ./example-app-nodejs-backend-react-frontend/package-lock.json ./

RUN npm install
RUN npm run build

COPY ./example-app-nodejs-backend-react-frontend .

FROM nginx:latest

COPY --from=build /app/build usr/share/nginx/html

