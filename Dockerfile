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


# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Install mongoDb
RUN apt-get update > /dev/null && \
    apt-get install -y curl && \
    curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.2.9.tgz && \
    tar -zxvf mongodb-linux-x86_64-3.2.9.tgz && \
    mv mongodb-linux-x86_64-3.2.9 mongodb && \
    rm -rf mongodb-linux-x86_64-3.2.9.tgz
        
# Create the MongoDB data directory
RUN mkdir -p /data/db

# Install Redis
RUN apt-get install -y redis-server
