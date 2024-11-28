# Sollte automatisch die korrekte Architektur verwenden (ARM / x86)
FROM mysql:8.0

# Default Variablen
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Skripte Kopieren
COPY ./init.sql /docker-entrypoint-initdb.d/

# Defaultport verwenden
EXPOSE 3306