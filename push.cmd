CALL docker tag token-generator-image:dev dragonnomada/token-generator:dev
CALL docker tag token-generator-image:stage-1 dragonnomada/token-generator:stage-1
CALL docker tag token-generator-image:prod dragonnomada/token-generator:prod
CALL docker tag token-generator-image:latest dragonnomada/token-generator:latest

CALL docker push dragonnomada/token-generator:dev
CALL docker push dragonnomada/token-generator:stage-1
CALL docker push dragonnomada/token-generator:prod
CALL docker push dragonnomada/token-generator:latest