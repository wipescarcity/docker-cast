# alpine means small and compact as possible
FROM node:alpine as builder

# ./app it will be created if it does not exist
WORKDIR app

# path to folder to build context
# install some dependencies
COPY ./package.json ./
RUN npm install

# copy current working directory to the app directory
COPY ./ ./

# default command
RUN npm run build

FROM nginx
COPY --from=builder /app/build /user/share/nginx/html


