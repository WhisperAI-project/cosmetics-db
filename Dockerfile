FROM mcr.microsoft.com/mssql/server:2025-latest

ENV ACCEPT_EULA=Y 
ENV SA_PASSWORD=Str0ng_PassW0rd!
ENV MSSQL_PID=Developer

WORKDIR /usr/src/app
COPY mock_cosmetics.csv .
COPY init-db.sql .
COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]