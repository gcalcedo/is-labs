# Launch Guide

1. `docker compose up -d`
2. `docker compose exec postgres bash`
3. `psql -U postgres`

Now an interactive shell with the database containing the schema and the required triggers is accessible. 