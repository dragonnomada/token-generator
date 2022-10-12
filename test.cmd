CALL docker stop token-generator-dev
CALL docker stop token-generator-stage_1
CALL docker stop token-generator-prod
CALL docker stop token-generator-test

CALL docker run --rm --name token-generator-dev -dp 3011:80 token-generator-image:dev
CALL docker run --rm --name token-generator-stage_1 -dp 3012:80 token-generator-image:stage-1
CALL docker run --rm --name token-generator-prod -dp 3013:80 token-generator-image:prod
CALL docker run --rm --name token-generator-test -dp 3010:80 token-generator-image:latest

CALL curl "localhost:3011"
CALL curl "localhost:3011/?n=64"
CALL curl "localhost:3011/version"

CALL curl "localhost:3012"
CALL curl "localhost:3012/?n=64"
CALL curl "localhost:3012/version"

CALL curl "localhost:3013"
CALL curl "localhost:3013/?n=64"
CALL curl "localhost:3013/version"

CALL curl "localhost:3010"
CALL curl "localhost:3010/?n=64"
CALL curl "localhost:3010/version"