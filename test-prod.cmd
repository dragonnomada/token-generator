CALL docker stop token-generator-prod
CALL docker container rm token-generator-prod
CALL docker run --name token-generator-prod -dp 4000:3000 token-generator:1.0.2-prod