FROM node:16-alpine as dev

COPY index.js /sources/
COPY package.json /sources/

WORKDIR /sources/

RUN npm install

CMD node index.js

ENV DEPLOY_MODE dev

EXPOSE 80

FROM dev as stage_1

RUN npx --yes pkg -t node16-linux-x64 index.js -o token-generator.bin

RUN chmod +x token-generator.bin

ENV DEPLOY_MODE stage_1

FROM ubuntu:22.04 as prod

COPY --from=stage_1 /sources/token-generator.bin /app/

WORKDIR /app/

CMD ./token-generator.bin

ENV DEPLOY_MODE prod

EXPOSE 80