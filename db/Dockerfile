FROM postgres:15.4

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=secretpass
ENV POSTGRES_DB=todo-db

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
