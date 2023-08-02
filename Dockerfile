FROM node:16-alpine as builder
WORKDIR /usr/app/
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# instruction comprise uniquement par elasticbeanstalk comme quoi une redirection doit être faite sur ce port
EXPOSE 80 
COPY --from=builder /usr/app/build /usr/share/nginx/html