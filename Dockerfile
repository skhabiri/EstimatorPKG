## Image to base ours on
## docker run debian
FROM debian

## Environment variables to configure things
## Setting shell so pipenv shell works
ENV SHELL=/bin/bash

## Update and install dependencies
## Running them in pipeline. \ is for continue into a new line
## update, updates the list of packages available for install
## and install all the security packages to have an up to date OS.
RUN apt update && \
  ## Yes to possible questions as it is not running interactively
  ## upgrade potentially installs new versions of outdated packages
  apt upgrade -y && \
  ## install python3 and pip3 at the same time
  apt install python3-pip -y && \
  pip3 install pandas numpy scikit-learn matplotlib && \
  pip3 install skestimate

## In command prompt:
## docker build . -t skestimate_di
## docker run -it skestimate_di
