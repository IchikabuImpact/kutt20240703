FROM node:18.17.0-alpine

RUN apk add --update bash python3 make g++ linux-headers

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --legacy-peer-deps --force

COPY . .

RUN chmod +x ./wait-for-it.sh

RUN npm cache clean --force

RUN npm run build

CMD ["npm", "start"]

