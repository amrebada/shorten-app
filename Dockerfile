FROM node:20.14.0-alpine3.20

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

COPY yarn.lock ./

RUN yarn

COPY . .

RUN npm run build

EXPOSE 3000
CMD [ "http-server", "dist", "-p", "3000" ]