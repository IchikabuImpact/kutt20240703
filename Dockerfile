FROM node:16.14.0-alpine

ENV NODE_OPTIONS="--max-old-space-size=3072"

# インストールするパッケージを追加
RUN apk add --update bash python3 make g++ linux-headers 

# Setting working directory
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps && npm install --save-dev @types/tough-cookie @types/react @types/react-dom
# Copying source files
COPY . .

# Give permission to run script
RUN chmod +x ./wait-for-it.sh

# Build files
RUN npm run build

EXPOSE 3000

# Running the app
CMD [ "npm", "start" ]

