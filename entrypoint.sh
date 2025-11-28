#!/bin/bash
set -e

# Startar SQL Server i bakgrunden
/opt/mssql/bin/sqlservr &

# Vänta tills SQL Server är redo
sleep 25

# Kör vårt SQL-init-skript
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /usr/src/app/init-db.sql

# Håll containern vid liv (vänta på SQL-processen)
wait
