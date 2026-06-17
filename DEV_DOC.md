# DEVELOPER DOCUMENTATION

This document explains how to set up, build, launch, and manage the Inception stack from scratch.

## Environment Setup

Before running the project, make sure you have the following installed on your machine:

* `git`
* `docker`
* `docker compose`

On Debian or Ubuntu, you can install `git` with:

```bash
sudo apt install git -y
```

Docker should be installed using the official Docker instructions for your distribution. After installation, make sure your user can run Docker commands without `sudo`.

The project also expects a few local files and directories:

* A `secrets` folder in the root of the repository.
* A `srcs/.env` file with the project configuration.
* A data directory under `/home/$USER/data` for persistent database and Wordpress files.

### Secrets

Create the `secrets` directory in the project root and add these files:

* `db_root_password.txt`
* `db_password.txt`
* `wp_admin_password.txt`
* `wp_user_password.txt`
* `wp_admin_email.txt`
* `wp_admin_username.txt`

These files are mounted as Docker secrets and read by the database and Wordpress containers at startup.

### Configuration

The main configuration file is [srcs/.env](/srcs/.env). It defines values such as:

* the domain name
* the MariaDB database name
* the MariaDB user name
* the Wordpress path inside the container
* the Wordpress admin and author user names

Update this file if you want to change the domain or the non-sensitive service settings.

## Build And Launch

The main entry point is the Makefile in the repository root.

### Build and start everything

```bash
make
```

This command does two things:

* creates the persistent data directories under `/home/$USER/data`
* runs `docker compose -f srcs/docker-compose.yml up --build -d`

That means the images are built if needed and the containers are started in detached mode.

### Other launch commands

```bash
make restart
```

Restarts the running containers without rebuilding them.

```bash
make stop
```

Stops the stack by running `docker compose -f srcs/docker-compose.yml down`.

```bash
make re
```

Performs a full reset by removing the stack and the local data directory, then builds and launches everything again.

## Container Management

The Makefile includes a few useful commands for working with the containers directly.

```bash
make testdb
```

Opens a MariaDB shell inside the running `mariadb` container.

```bash
make buildmariadb
```

Builds only the MariaDB image.

```bash
make runmariadb
```

Builds and runs the MariaDB image locally.

For direct Docker Compose inspection, the following commands are also useful:

```bash
docker compose -f srcs/docker-compose.yml ps
```

Shows the current status of the services.

```bash
docker compose -f srcs/docker-compose.yml logs <service-name>
```

Shows the logs for a specific service such as `database`, `wordpress`, or `nginx`.

## Data Storage and Persistence

This project stores persistent data outside the containers so it survives restarts.

The Docker Compose file maps two bind-mounted volumes:

* `databasefiles` -> `/home/$USER/data/mariadb`
* `wordpressfiles` -> `/home/$USER/data/wordpress`

Inside the containers, those paths are mounted at:

* MariaDB data: `/var/lib/mysql`
* Wordpress files: `/srv/www`

Because these are bind mounts backed by directories on the host machine, the database contents and Wordpress files remain available after the containers stop or are recreated.

If you want to remove the persistent data completely, use:

```bash
make fclean
```

That command stops the stack, removes unused Docker objects, and deletes `/home/$USER/data`.

## Useful Summary

* Build and run: `make`
* Stop: `make stop`
* Restart: `make restart`
* Full reset: `make re`
* Inspect MariaDB: `make testdb`