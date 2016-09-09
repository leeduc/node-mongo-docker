FROM node:6.5-wheezy
ENV MONGODB_VERSION 3.2.7

MAINTAINER Sindre Seppola <sblix.dev@gmail.com>


# Mongodb install instructions:
#  - https://docs.docker.com/engine/examples/mongodb/
#  - https://docs.mongodb.com/v2.6/tutorial/install-mongodb-on-debian/

# Improvement inspiration:
#  - https://github.com/docker-library/mongo/blob/master/3.0/Dockerfile


# Import the public key used by the package management system.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10


# Create a list file for MongoDB
RUN echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list



# Reload local package database
RUN apt-get update && \
    apt-get install -y apt-utils


# Create the MongoDB data directory
RUN mkdir -p /data/db


# Install the MongoDB packages
RUN apt-get install -y \
      mongodb-org \
      mongodb-org-server \
      mongodb-org-shell \
      mongodb-org-mongos \
      mongodb-org-tools
