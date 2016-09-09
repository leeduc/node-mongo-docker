FROM node:6.4.0
ENV MONGODB_VERSION 2.6.9

MAINTAINER Sindre Seppola <sblix.dev@gmail.com>


# Mongodb install instructions:
#  - https://docs.docker.com/engine/examples/mongodb/
#  - https://docs.mongodb.com/v2.6/tutorial/install-mongodb-on-debian/

# Improvement inspiration:
#  - https://github.com/docker-library/mongo/blob/master/3.0/Dockerfile


# Import the public key used by the package management system.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927


# Create a list file for MongoDB
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list



# Reload local package database
RUN apt-get update && \
    apt-get install -y apt-utils


# Create the MongoDB data directory
RUN mkdir -p /data/db


# Install the MongoDB packages
RUN sudo apt-get install -y mongodb-org=3.2.9 mongodb-org-server=3.2.9 mongodb-org-shell=3.2.9 mongodb-org-mongos=3.2.9 mongodb-org-tools=3.2.9
