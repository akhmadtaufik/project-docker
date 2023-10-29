# Project Documentation

## Overview

This documentation provides detailed instructions for setting up and running a web application using Docker Compose. The application consists of two services: an app service created with Flask and a database service using PostgreSQL.

## Prerequisites

Before you proceed with running the application, make sure you have the following prerequisites installed on your system:

- Docker: Docker is a platform that uses OS-level virtualization to deliver software in packages called containers. You can download and install Docker from here.
- Docker Compose: Docker Compose is a tool for defining and running multi-container Docker applications.

## Project Sturture
The project structure is organized as follows:
```
.
├── backup
├── db
│   ├── init.sql
│   └── Dockerfile
├── flask-app
│   ├── app
│   │    ├─ static
│   │    │   └── assets
│   │    ├─ templates
│   │    │   ├─ add.html
│   │    │   ├─ adduser.html
│   │    │   ├─ base.html
│   │    │   ├─ edit.html
│   │    │   ├─ home.html
│   │    │   └─ login.html
│   │    ├─ __init__.py
│   │    ├─ home.py
│   │    ├─ login.p
│   │    └─ model.py
│   ├── .flaskenv
│   ├── config.py
│   ├── kanban.py
│   ├── Dockerfile
│   └── requirements.txt
├── docker-compose.yml
└── README.MD

```

## Setup and Installation
### Setup
#### Tools
- Python: The programming language used to develop the Flask application.
- PostgreSQL: The database management system used to store and manage the application’s data.
- Dbeaver: A database management tool used for database administration.
#### Prerequisites
The `requirements.txt` file lists the Python dependencies that need to be installed. Here are the contents of the `requirements.txt` file:
- blinker==1.6.3
- click==8.1.7
- colorama==0.4.6
- Flask==3.0.0
- Flask-JWT-Extended==4.5.3
- Flask-SQLAlchemy==3.1.1
- greenlet==3.0.1
- importlib-metadata==6.8.0
- itsdangerous==2.1.2
- Jinja2==3.1.2
- MarkupSafe==2.1.3
- psycopg2-binary==2.9.9
- PyJWT==2.8.0
- python-dotenv==1.0.0
- SQLAlchemy==2.0.22
- typing_extensions==4.8.0
- Werkzeug==3.0.1
- zipp==3.17.0

#### Image for Flask
The Dockerfile for the Flask application is as follows:
```Dockerfile
FROM python:3.9.16

COPY . ./todo-app

WORKDIR /todo-app

RUN pip install -r requirements.txt

EXPOSE 5000

```
- `FROM python:3.9.16`: This line specifies the base image for the Docker container. In this case, it’s using the official Python image version 3.9.16.

- `COPY . ./todo-app`: This line copies the current directory (on your local system) into the Docker image. The `.` represents the current directory, and `./todo-app` is the destination in the Docker image.
 
- `WORKDIR /todo-app`: This line sets the working directory in the Docker image to `/todo-app`. All subsequent commands (like the `RUN` command) will be run in this directory.

- `RUN pip install -r requirements.txt`: This line installs the Python dependencies for your application. It assumes that you have a `requirements.txt` file in your current directory.

- `EXPOSE 5000`: This line tells Docker to expose port 5000 from the Docker container to your local system. This is typically used for network communication between your Docker container and your local system.

After building a Docker image using this Dockerfile, you can run your application in a Docker container with isolated dependencies and network configuration.

#### Image for PostgreSQL
The Dockerfile for the PostgreSQL service is as follows:
```Dockerfile
FROM postgres:15.4

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=secretpass
ENV POSTGRES_DB=todo-db

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
```

- `FROM postgres:15.4`: This line specifies the base image for the Docker container. In this case, it’s using the official PostgreSQL image version 15.4.

- `ENV POSTGRES_USER=postgres`: This line sets an environment variable in the Docker image. Here, it’s setting the PostgreSQL username to `postgres`.

- `ENV POSTGRES_PASSWORD=secretpass`: This line sets the PostgreSQL password to `secretpass`.

- `ENV POSTGRES_DB=todo-db`: This line sets the PostgreSQL database name to `todo-db`.

- `COPY init.sql /docker-entrypoint-initdb.d/`: This line copies the `init.sql` file from your current directory to `/docker-entrypoint-initdb.d/` in the Docker image. The scripts in this directory are automatically executed upon container startup.

- `EXPOSE 5432`: This line tells Docker to expose port 5432 from the Docker container to your local system. This is typically used for network communication between your Docker container and your local system.

After building a Docker image using this Dockerfile, you can run your PostgreSQL service in a Docker container with isolated dependencies and network configuration.

### Installation
#### Git Clone
Clone this repository to your local machine using the following command:
```sh
git clone https://github.com/akhmadtaufik/project-docker.git
```
#### Docker Compose File
Here’s an example of a `docker-compose.yml` file:
```yml
version: '3.8'
services:
  app:
    build:
      context: ./flask-app
      dockerfile: Dockerfile
    container_name: todo-flask-container
    ports:
      - 5000:5000
    command: bash -c "flask run --host=0.0.0.0 --port=5000"
    depends_on:
      - db
    networks:
      - todo-network
    restart: always

  db:
    build:
      context: ./db
      dockerfile: Dockerfile
    container_name: todo-db-container
    ports:
      - 5435:5432
    volumes:
      - todo-volume:/var/lib/postgresql/data
    networks:
      - todo-network

networks:
  todo-network:
    name: todo-network

volumes:
  todo-volume:
    name: todo-volume
```
The Docker Compose file you provided is designed to orchestrate the deployment of a multi-container application, specifically a Flask application and a PostgreSQL database. It uses version 3.8 of the Docker Compose file format.

The `app` service is built from a Dockerfile located in the `./flask-app` directory. The resulting container is named `todo-flask-container` and exposes port 5000 for network communication. The Flask application is started with the command `flask run --host=0.0.0.0 --port=5000`. This service depends on the `db` service and is connected to the `todo-network`. The `restart: always` policy ensures that the container restarts automatically if it stops.

The `db` service is built from a Dockerfile located in the `./db` directory. The resulting container, named `todo-db-container`, exposes port 5432 (mapped to port 5435 on the host) for network communication. It also mounts a volume named `todo-volume` at `/var/lib/postgresql/data` for data persistence.

Both services are connected through a network named `todo-network`, and data persistence is achieved through a volume named `todo-volume`. This setup ensures that the Flask application and PostgreSQL database can communicate with each other while maintaining data persistence.

#### Run the Docker Compose
Here are the updated step-by-step instructions to run the Docker Compose:

1. Open your terminal.

2. Navigate to the directory containing your docker-compose.yml file.

3. Run the following command to start the db service first:
    ```sh
    docker-compose up -d db
    ```

    This command will start the PostgreSQL database service defined in your docker-compose.yml file in detached mode (the -d option), meaning it will run in the background.

4. Once the db service is up and running, you can start the app service with the following command:
    ```sh
    docker-compose up -d app
    ```

    This command will start the Flask application service.

5. To check if your services are running, you can use the following command:
    ```sh
    docker-compose ps
    ```
    
    This will show you the status of your containers.

6. Now, your Flask application should be accessible at `http://localhost:5000`, and your PostgreSQL database should be accessible at `localhost:5435`.

7. If you make any changes to your application or database, you can update the running containers by running `docker-compose up -d` again.

Also, note that it’s crucial to start the db service before the app service because the application depends on the database to be fully operational.

## Backup and Restore
### Backup
### Restore