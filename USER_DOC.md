# USER DOCUMENTATION

*Welcome user!*

This document, in short, will explain how after having downloaded the repository you will be able to run it and use it.

If you have any doubts about what you need to install everything you need please refer to the installation section of the README.

## The Stack


This project runs a small Wordpress website with three services managed by Docker Compose and started through the Makefile.

The stack is made of these containers:

* **MariaDB** stores the Wordpress database.
* **Wordpress** serves the website and handles the admin panel.
* **Nginx** acts as a reverse proxy and serves the site over HTTPS.

The services share one Docker network so they can communicate with each other by service name.

## Starting and Stopping the Project

From the root of the project, run:

```bash
make
```

This builds the images if needed, creates the data directories, and starts the containers in the background.

To restart the running containers, use:

```bash
make restart
```

To stop the stack, use:

```bash
make stop
```

To stop the containers and remove unused Docker data, use:

```bash
make clean
```

If you also want to remove the persistent data stored under `/home/$USER/data`, use:

```bash
make fclean
```

[*To read about the remaining make commands please refer to the Build and Launch section in the DEV_DOC. (clicking on this link will take you there)*](/DEV_DOC.md#build-and-launch)

## Accessing the Website

By default, the website is available at:

```text
https://toferrei.42.fr
```

Open that address in a browser while the project is running. If you change the domain name in [srcs/.env](/srcs/.env), use the new domain instead.

You also need a matching entry in `/etc/hosts` that points the domain to `127.0.0.1`.

The Wordpress administration panel is available at:

```text
https://toferrei.42.fr/wp-admin
```

Log in there with the administrator credentials created from your secret files.

## Managing Credentials

The sensitive credentials are not stored directly in the repository.

You should create a `secrets` folder in the root of the project with these files:

* `db_root_password.txt`
* `db_password.txt`
* `wp_admin_password.txt`
* `wp_user_password.txt`
* `wp_admin_email.txt`
* `wp_admin_username.txt`

These files are read by Docker Compose and passed to MariaDB and Wordpress at container start.

The non-sensitive settings, such as the domain name, database name, and Wordpress username, are stored in [srcs/.env](/srcs/.env).

## Checking That Everything Works

If the stack started correctly, you should see three running containers:

* `mariadb`
* `wordpress` running as `wp-php`
* `nginx`

You can check their status with:

```bash
docker compose -f srcs/docker-compose.yml ps
```

If you want to inspect a service, check its logs with:

```bash
docker compose -f srcs/docker-compose.yml logs <service-name>
```

For example, to check the database directly, the Makefile also includes:

```bash
make testdb
```

This opens a MariaDB shell inside the running database container.