CALL docker compose --profile dev down
CALL docker compose --profile prod down

CALL timeout 5

CALL docker compose --profile dev up -d
CALL docker compose --profile prod up -d

CALL timeout 5

CALL curl "localhost:5011"
CALL curl "localhost:5011/?n=64"
CALL curl "localhost:5011/version"

CALL curl "localhost:5013"
CALL curl "localhost:5013/?n=64"
CALL curl "localhost:5013/version"