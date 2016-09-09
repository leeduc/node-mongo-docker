FROM node:6.3.0
ENV MONGODB_VERSION 3.1.0

MAINTAINER Sindre Seppola <sblix.dev@gmail.com>


# Mongodb install instructions:
#  - https://docs.docker.com/engine/examples/mongodb/
#  - https://docs.mongodb.com/v2.6/tutorial/install-mongodb-on-debian/

# Improvement inspiration:
#  - https://github.com/docker-library/mongo/blob/master/3.0/Dockerfile


# Import the public key used by the package management system.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10


# Create a list file for MongoDB
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.1 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.1.list



# Reload local package database
RUN apt-get update && \
    apt-get install -y apt-utils


# Create the MongoDB data directory
RUN mkdir -p /data/db


# Install the MongoDB packages
RUN apt-get install -y \
      mongodb-org=$MONGODB_VERSION \
      mongodb-org-server=$MONGODB_VERSION \
      mongodb-org-shell=$MONGODB_VERSION \
      mongodb-org-mongos=$MONGODB_VERSION \
      mongodb-org-tools=$MONGODB_VERSION
