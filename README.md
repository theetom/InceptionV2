*This project has been created as part of the 42 curriculum by toferrei.*

# Inception

## Description

#### *From the subject*

*This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.*

This project makes us set up three (or more) containers with the goal of creating a basic Wordpress website.

The three containers setup for this project were the following:

* MariaDB, a SQL database.
* Nginx, a reverse proxy server.
* Wordpress, a web content management system.

## Instructions

*This section will guide through the complete installation of the this project, it assumes that you have zero knowledge of linux systems. But that you are using a computer, or Virtual Machine with either Debian or Ubuntu, and that you have the permissions to install software. For other distributions of Linux, you'll have to use their respective package managers (the programs that install other programs).*

### 1. Installation

For this project, you'll need the following on your machine:

* **Cmake**
* **Github**
* **Docker**

For both Cmake and Github run the following lines in your terminal.

```bash
sudo apt install cmake -y
sudo apt install git -y
```

For docker the installation is a bit complex. You can follow their installation guide [here for debian](https://docs.docker.com/engine/install/debian/#install-using-the-repository) and [here for ubuntu](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

After installing Docker add yourself to the Docker group:

```bash
sudo usermod -aG docker $USER
```

Then either logout and log back in or:

```bash
newgrp docker
```

### 2. Downloading the Repository (project)

Once you have completed the installation of the various software you will need to download the repository. You can run the following command.

```bash
git clone https://github.com/theetom/InceptionV2.git Inception
```

Change into to the directory that was just created.

```bash
cd Inception
```

### 3. Creating and Populating the Secrets Folder

To run, Docker will need access to certain variables that should be unique and not located in the downloadable repository [(more about it in the Secrets vs Environment Variables section)](#secrets-vs-environment-variables). As such, you will need to create a folder in the root of the project.

You can run the following command:

```bash
mkdir secrets
```

Then change into the folder you just created.

```bash
cd secrets
```

Here you will have to create six files. 
* db_root_password.txt
* db_password.txt
* wp_admin_password.txt
* wp_user_password.txt
* wp_admin_email.txt
* wp_admin_username.txt

You can just run the following command.

```bash
touch db_root_password.txt db_password.txt wp_admin_password.txt wp_user_password.txt wp_admin_email.txt wp_admin_username.txt
```

You then will have to write in each of them the passwords, email, and username you want. Or alternatively run the following command to have them all with basic, unsafe passwords.

```bash
echo -n "password" >> db_root_password.txt && echo -n "password" >> db_password.txt && echo -n "password" >> wp_admin_password.txt && echo -n "password" >> wp_user_password.txt && echo -n "admin@admin.com" >> wp_admin_email.txt && echo -n "admin" >> wp_admin_username.txt
```

### 4. Adding Domain Name to Host file

Finally the last step before you can launch the project. Right now, if you run the following:

```bash
make
```

You won't be able to access your website through your chosen domain name (you can change it [here](/srcs/.env)).
The last command is to add a mapping from 127.0.0.1 (localhost) to your domain.

```bash
sudo sh -c 'echo "127.0.0.1 toferrei.42.fr" >> /etc/hosts'
```

If you changed your domain name in the [.env file](/srcs/.env). Change the above line accordingly.

###

## Resources

## Project Description

### Virtual Machines vs Docker

### Secrets vs Environment Variables

### Docker Network vs Host Network

### Docker Volumes vs Bind Mounts

