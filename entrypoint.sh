#!/bin/bash
set -e

# Starta SQL Server i bakgrunden
/opt/mssql/bin/sqlservr &

# Vänta tills SQL Server är redo
sleep 25

# Kör init-skript utan att verifiera självsignerat certifikat
/opt/mssql-tools/bin/sqlcmd -C -No -S localhost -U sa -P "$SA_PASSWORD" -i /usr/src/app/init-db.sql

# Håll containern igång
wait
