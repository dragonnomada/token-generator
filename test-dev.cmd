CALL docker stop token-generator-dev
CALL docker container rm token-generator-dev
CALL docker run --name token-generator-dev -dp 3000:3000 token-generator:1.0.1-dev