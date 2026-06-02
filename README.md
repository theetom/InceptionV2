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

`sudo apt install cmake -y`
`sudo apt install git -y`

For docker the installation is a bit complex. You can follow their installation guide [here for debian](https://docs.docker.com/engine/install/debian/#install-using-the-repository) and [here for ubuntu](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

### 2. Downloading the Repository (project)

Once you have completed the installation of the various software you will need to download the repository. You can run the following command.

`git clone https://github.com/theetom/InceptionV2.git Inception`

Change into to the directory that was just created.

`cd Inception`

### 3. Creating and Populating the Secrets Folder

To run, Docker will need access to certain variables that should be unique and not located in the downloadable repository [(more about it in the Secrets vs Environment Variables section)](#secrets-vs-environment-variables). As such, you will need to create a folder in the root of the project.

You can run the following command:

`mkdir secrets`

Then change into the folder you just created.

`cd secrets`

Here you will have to create six files. 
* db_root_password.txt
* db_password.txt
* wp_admin_password.txt
* wp_user_password.txt
* wp_admin_email.txt
* wp_admin_username.txt

You can just run the following command.

`touch db_root_password.txt db_password.txt wp_admin_password.txt wp_user_password.txt wp_admin_email.txt wp_admin_username.txt`

You then will have to write in each of them the passwords, email, and username you want. Or alternatively run the following command to have them all with basic, unsafe passwords.

`echo "password" >> db_root_password.txt && echo "password" >> db_password.txt && echo "password" >> wp_admin_password.txt && echo "password" >> wp_user_password.txt &&`





###

## Resources

## Project Description

### Virtual Machines vs Docker

### Secrets vs Environment Variables

### Docker Network vs Host Network

### Docker Volumes vs Bind Mounts

