FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

COPY yarn.lock ./

RUN yarn

COPY . .

RUN npm run build

EXPOSE 3000
CMD [ "http-server", "dist", "-p", "3000" ]