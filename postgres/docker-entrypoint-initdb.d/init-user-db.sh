#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER sample_app PASSWORD 'testtest';
    CREATE DATABASE sample_db;
    GRANT ALL PRIVILEGES ON DATABASE sample_db TO sample_app;
EOSQL
