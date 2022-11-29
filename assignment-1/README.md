# Assignment 1 - Normalisation and Triggers

## 🚀 - Launch Guide

1. `docker compose up -d`
2. `docker compose exec postgres bash`
3. `psql -U postgres`

An interactive shell with the database containing the schema and the required triggers is now accessible.

## 📄 - SQL Files

Files (.sql) for every task are contained under /sql. These files are all executed automatically on `docker compose up -d`.

## 📦 - Sample Data

The database is populated with the `sql/task_fill.sql` script by default, which contains sample data insertion. To disable this, comment out or remove the volume mount on `docker-compose.yml`, at line `17`.
