FROM node:10-alpine as builder
RUN mkdir /app
WORKDIR /app
COPY angular-app/package.json angular-app/package-lock.json /app/angular-app/
RUN npm install --prefix angular-app
COPY . /app
ARG configuration=production
RUN npm run build --prefix angular-app -- --output-path=./dist/out --configuration $configuration


 
FROM nginx:1.15.7-alpine
RUN rm -rf /usr/share/nginx/html/*
RUN apk add nano && apk add curl
COPY --from=builder /app/angular-app/dist/out /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf