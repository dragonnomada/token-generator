CALL docker build --target dev -t token-generator-image:dev .
CALL docker build --target stage_1 -t token-generator-image:stage-1 .
CALL docker build --target prod -t token-generator-image:prod .
CALL docker build -t token-generator-image:latest .
