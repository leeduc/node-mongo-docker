FROM ubuntu:16.04
ENV MONGODB_VERSION 3.2.7

MAINTAINER Le Duc <lee.duc55@gmail.com>

# NodeJs install instructions:
#  - https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04

# Reload local package database
RUN apt-get update && \
    apt-get install -y build-essential tcl && \
    apt-get install -y apt-utils

# Install NodeJs
RUN apt-get install -y nodejs && \
    apt-get install -y npm

# Mongodb install instructions:
#  - https://docs.docker.com/engine/examples/mongodb/
#  - https://docs.mongodb.com/v2.6/tutorial/install-mongodb-on-debian/

# Improvement inspiration:
#  - https://github.com/docker-library/mongo/blob/master/3.0/Dockerfile


# Import the public key used by the package management system.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10


# Install mongoDb
RUN apt-get update && apt-get install -y mongodb-org=3.3.9 mongodb-org-server=3.3.9 mongodb-org-shell=3.3.9 mongodb-org-mongos=3.3.9 mongodb-org-tools=3.3.9

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Install Redis
RUN apt-get install -y redis-server
