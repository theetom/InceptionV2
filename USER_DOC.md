# USER DOCUMENTATION

*Welcome user!*

This document, in short, will explain how after having downloaded the repository you will be able to run it and use it.

If you have any doubts about what you need to install everything you need please refer to the installation section of the README.

## The Stack

This project is composed of three microservices that together form the basis for a small Wordpress based website, and Docker Compose to orchestrate it. Lastly, there is a Makefile allowing you to use smaller commands to set up the containers, stop them, or restart them.

There are three microservices in three corresponding containers. A database (MariaDB), the Wordpress, and a reverse proxy server (Nginx).

All you need to run the server is to use the before mentioned make commands.

## Starting and Stopping the Project

    make

Will make all the images and run the containers from them.

    make restart

Will restart the containers.

    make stop

Will strictly stop the containers.

    make clean

Will stop the containers and delete them.

[*To read about the remaining make commands please refer to the Build and Launch section in the DEV_DOC. (clicking on this link will take you there)*](/DEV_DOC.md#build-and-launch)

## Accessing the Website

By default this website has the following domain: https://toferrei.42.fr

To access it you can just type it into a browser while the project is running. You can also personalize this domain by accessing .env file and changing to anything your heart desires.

There, you can also personalize some of the usernames for the various services (refrain from putting passwords *See Managing Credentials section*).

[*Link to .env*](/srcs/.env)

## Managing Credentials

The credentials do not come by default with the repository, as it would lead to weaker security.

As such, if you followed, the [Instructions](/README.md#3-creating-the-secrets-folder) section in the READ_ME you should have a folder named secrets in the root of the project with six files, one for each password that is required for this project, and other important variables that need to be kept secret.