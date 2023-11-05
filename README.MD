# Project Documentation

## Overview

As prospective Software & Data Engineers, one of the primary challenges encountered is the successful deployment of projects. This documentation serves as a comprehensive guide addressing this challenge, focusing on the setup and execution of a web application utilizing Docker Compose. The scope of this guide, specifically the Linux and Container Project, is confined to the deployment of a pre-existing web application developed by the Pacmann team, and configurations pertaining to Docker and Linux. The application in question is composed of two integral services: a Flask-based app service and a PostgreSQL database service.

## Project Objective
This project comprises two primary components:
1. **Deployment**: The deployment of this application utilises Docker as the principal tool. Participants are required to create two images essential for running the application. These images include:
    - An image for the Flask application.
    - An image for the PostgreSQL database. The Flask application image is dependent on the PostgreSQL image due to the Flask application’s requirement for a connection to the PostgreSQL database upon execution.
2. **Automated Data Backup Scheduling**: In addition to deployment tasks, a crucial component of this project is the establishment of an automatic data backup schedule for the PostgreSQL database. This backup operation, conducted daily, is a key measure to ensure the security and reliability of data. To further enhance data protection, a specialised script will be developed for restoring data from these backups. This feature ensures a swift recovery of data, mitigating potential losses in the event of database failure or damage.

## Prerequisites

Before running the application, please ensure the necessary prerequisites are installed on your system.

- **Docker**: Docker is a sophisticated platform that employs OS-level virtualization to deliver software in packages, referred to as containers. Docker can be downloaded and installed from the provided link.
- **Docker Compose**: Docker Compose is a tool designed for defining and running multi-container Docker applications. It is essential for the successful operation of this application.

## Project Sturture
The organization of the project structure is as follows:
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

## Configuration and Installation
### Configuration
#### Instruments
- **Python**: The programming language employed for the development of the Flask application.
- **PostgreSQL**: The database management system utilized for the storage and management of the application's data.
- **Dbeaver**: A database management instrument applied for database administration.
#### Requirements
The `requirements.txt` file enumerates the Python dependencies that necessitate installation. The contents of the `requirements.txt` file are as follows:
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

#### Flask Image
The Dockerfile for the Flask application is structured as follows:
```Dockerfile
FROM python:3.9.16

COPY . ./todo-app

WORKDIR /todo-app

RUN pip install -r requirements.txt

EXPOSE 5000

```
- `FROM python:3.9.16`: This directive designates the base image for the Docker container, which in this instance is the official Python image version 3.9.16.

- `COPY . ./todo-app`: This directive copies the current directory from your local system into the Docker image. The `.` symbolizes the current directory, while `./todo-app` denotes the destination within the Docker image.
 
- `WORKDIR /todo-app`: This directive establishes `/todo-app` as the working directory within the Docker image. All subsequent directives (such as the `RUN` directive) will be executed within this directory.

- `RUN pip install -r requirements.txt`: This directive installs the Python dependencies for your application, predicated on the presence of a `requirements.txt` file within your current directory.

- `EXPOSE 5000`: This directive instructs Docker to expose port 5000 from the Docker container to your local system, typically facilitating network communication between your Docker container and your local system.

Upon constructing a Docker image using this Dockerfile, you can execute your application within a Docker container with isolated dependencies and network configuration.

#### PostgreSQL Image
The Dockerfile for the PostgreSQL service is structured as follows:
```Dockerfile
FROM postgres:15.4

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=secretpass
ENV POSTGRES_DB=todo-db

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
```
- `FROM postgres:15.4`: This directive designates the base image for the Docker container, which in this instance is the official PostgreSQL image version 15.4.

- `ENV POSTGRES_USER=postgres`: This directive establishes an environment variable within the Docker image, setting the PostgreSQL username to `postgres`.

- `ENV POSTGRES_PASSWORD=secretpass`: This directive sets the PostgreSQL password to `secretpass`.

- `ENV POSTGRES_DB=todo-db`: This directive sets the PostgreSQL database name to `todo-db`.

- `COPY init.sql /docker-entrypoint-initdb.d/`: This directive copies the `init.sql` file from your current directory to `/docker-entrypoint-initdb.d/` within the Docker image. Scripts located within this directory are automatically executed upon container startup.

- `EXPOSE 5432`: This directive instructs Docker to expose port 5432 from the Docker container to your local system, typically facilitating network communication between your Docker container and your local system.

Upon constructing a Docker image using this Dockerfile, you can execute your PostgreSQL service within a Docker container with isolated dependencies and network configuration.

### Configuration and Execution
#### Repository Cloning
Clone this repository to your local machine utilizing the following command:
```sh
git clone https://github.com/akhmadtaufik/project-docker
```
#### Docker Compose File
The provided `docker-compose.yml` file is structured as follows:
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
The Docker Compose file orchestrates the deployment of a multi-container application, specifically a Flask application and a PostgreSQL database, using version 3.8 of the Docker Compose file format.

The `app` service is built from a Dockerfile located in the `./flask-app` directory, resulting in a container named `todo-flask-container` that exposes port 5000 for network communication. The Flask application is initiated with the command `flask run --host=0.0.0.0 --port=5000`. This service depends on the `db` service and is connected to the `todo-network`. The `restart: always` policy ensures that the container restarts automatically if it stops.

The `db` service is built from a Dockerfile located in the `./db` directory, resulting in a container named `todo-db-container` that exposes port 5432 (mapped to port 5435 on the host) for network communication. It also mounts a volume named `todo-volume` at `/var/lib/postgresql/data` for data persistence.

Both services are connected through a network named `todo-network`, and data persistence is achieved through a volume named `todo-volume`. This setup ensures that the Flask application and PostgreSQL database can communicate with each other while maintaining data persistence.

#### Execution of Docker Compose
Follow these instructions to execute Docker Compose:

1. Open your terminal.

2. Navigate to the directory containing your docker-compose.yml file.

3. Execute the following command to initiate the db service first:
    ```sh
    docker-compose up -d db
    ```

   This command initiates the PostgreSQL database service defined in your docker-compose.yml file in detached mode (the -d option), allowing it to run in the background.

4. Once the db service is operational, initiate the app service with the following command:
    ```sh
    docker-compose up -d app
    ```

   This command initiates the Flask application service.

5. To verify if your services are operational, use the following command:
    ```sh
    docker-compose ps
    ```
    
   This will display the status of your containers.

6. Your Flask application should now be accessible at `http://localhost:5000`, and your PostgreSQL database should be accessible at `localhost:5435`.

7. If you make any modifications to your application or database, you can update the running containers by executing `docker-compose up -d` again.

Please note that it’s crucial to initiate the db service prior to the app service because the application depends on the database being fully operational.

## Backup and Restore
### Database Backup

#### Backup Script

The backup process is automated using a bash script named `backup.sh`. This script performs a backup of the database within the Docker container and saves it to a specified location. The script is as follows:

```bash
#!/bin/bash

# Obtain the current date in YYMMDD format
TIMESTAMP=$(date +%y%m%d)

# Backup the database using pg_dumpall via docker exec
docker exec todo-db-container bash -c "pg_dumpall -U postgres > /backups/backup_$TIMESTAMP.sql"

# Check if pg_dumpall was successful or failed
if [ $? -eq 0 ]; then
    echo "Backup successful on $TIMESTAMP."
else
    echo "Backup failed on $TIMESTAMP."
fi
```

The script operates by obtaining the current date in the `YYMMDD` format and storing it in the `TIMESTAMP` variable. It then uses `docker exec` to run `pg_dumpall` within the `todo-db-container` Docker container, outputting the result to a SQL file named `backup_$TIMESTAMP.sql` in the `/backups` directory. The script then checks whether `pg_dumpall` was successful or not, outputting a message accordingly.

#### Scheduling Backups with Crontab

The `backup.sh` script is scheduled to run automatically using crontab. The following line is added to the crontab configuration to schedule the script to run daily at midnight:

```bash
0 0 * * * /home/phy/LinuxAndContainer/web-app/backup.sh >> /home/phy/LinuxAndContainer/web-app/logs/cron.log 2>&1
```

This line schedules `backup.sh` to run at midnight every day (indicated by `0 0 * * *`). The output of the script, including any errors, is redirected to a log file located at `/home/phy/LinuxAndContainer/web-app/logs/cron.log`.

This setup ensures that backups are created regularly and that any issues with the backup process are logged for review.

### Database Restoration

#### Restoration Script

The restoration process is automated using a bash script named `restore.sh`. This script performs a restoration of the database within the Docker container from a specified backup file. The script is as follows:

```bash
#!/bin/bash

# Environment Variables
DB_USER="postgres"
DB_PASSWORD=$POSTGRES_PASSWORD
DB_NAME="todo-db"
CONTAINER_NAME="todo-db-container"
BACKUP_DIR="/backups"

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
LOG_FILE="/home/phy/LinuxAndContainer/web-app/logs/restore_$TIMESTAMP.log"

# Display list of backup files
echo "$(date +"%Y-%m-%d %H:%M:%S") List of backup files:" | tee -a $LOG_FILE
docker exec $CONTAINER_NAME ls $BACKUP_DIR | tee -a $LOG_FILE

# Ask user to enter the name of the backup file
read -p "Enter the name of the backup file you want to restore: " BACKUP_FILE

# Create full path to backup file
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Check if backup file exists
if docker exec $CONTAINER_NAME test -f $BACKUP_PATH; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") Backup file found." | tee -a $LOG_FILE
else
    echo "$(date +"%Y-%m-%d %H:%M:%S") Backup file not found. Restoration process cancelled." | tee -a $LOG_FILE >&2
    exit 1
fi

# Command to restore database
if docker exec -i $CONTAINER_NAME bash -c "psql -U $DB_USER -d $DB_NAME < $BACKUP_PATH"; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") Database restoration successful." | tee -a $LOG_FILE
else
    echo "$(date +"%Y-%m-%d %H:%M:%S") Database restoration failed." | tee -a $LOG_FILE >&2
fi
```

The script operates by obtaining the current date and time, storing it in the `TIMESTAMP` variable, and creating a log file named `restore_$TIMESTAMP.log` in the `/home/phy/LinuxAndContainer/web-app/logs/` directory. It then displays a list of available backup files and prompts the user to enter the name of the backup file they wish to restore. If the specified backup file exists, it uses `psql` within the `todo-db-container` Docker container to restore the database from the backup file. The script then checks whether `psql` was successful or not, outputting a message accordingly.

#### Running the Restoration Script

To run the restoration script, open your terminal, navigate to the directory containing your `restore.sh` file, and execute it using `./restore.sh`. Follow the prompts to enter the name of the backup file you wish to restore.

## References

For a more detailed explanation, please refer to the Medium article linked below:

[Deployment and Data Backup with Docker Compose: A Comprehensive Guide](https://medium.com/@akhmadtaufik/mengoptimalkan-deployment-aplikasi-web-flask-postgresql-dan-docker-compose-7a2a67c573b9)

In the article, you will find a complete guide, along with step-by-step instructions for deploying a Flask application and PostgreSQL database, as well as setting up automated data backups and restores. This resource will provide a comprehensive understanding of the deployment process and data management.
