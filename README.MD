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