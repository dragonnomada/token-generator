FROM node:16-alpine

COPY index.js /sources/
COPY package.json /sources/

WORKDIR /sources/

RUN npm install

CMD node index.js

EXPOSE 3000