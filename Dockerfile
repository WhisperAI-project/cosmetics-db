FROM mcr.microsoft.com/mssql/server:2025-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Str0ng_PassW0rd!
ENV MSSQL_PID=Developer

# Installera mssql-tools (sqlcmd)
USER root
RUN apt-get update && \
	apt-get install -y curl gnupg && \
	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
	curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list -o /etc/apt/sources.list.d/mssql-release.list && \
	apt-get update && ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
	echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> /etc/profile.d/mssql-tools.sh && \
	ln -s /opt/mssql-tools18 /opt/mssql-tools && \
	rm -rf /var/lib/apt/lists/*

USER mssql

WORKDIR /usr/src/app

# Kopiera filer
COPY mock_cosmetics.csv .
COPY init-db.sql .
COPY entrypoint.sh .

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

