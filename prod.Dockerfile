FROM token-generator:1.0.2-dev as dev

RUN npx --yes pkg -t node16-linux-x64 index.js -o token-generator.bin

RUN chmod +x token-generator.bin

FROM ubuntu:22.04

COPY --from=dev /sources/token-generator.bin /app/

WORKDIR /app/

CMD ./token-generator.bin

EXPOSE 3000