FROM node:6.4.0
ENV MONGODB_VERSION 3.2.9

MAINTAINER Sindre Seppola <sblix.dev@gmail.com>


# Mongodb install instructions:
#  - https://docs.docker.com/engine/examples/mongodb/
#  - https://docs.mongodb.com/v2.6/tutorial/install-mongodb-on-debian/

# Improvement inspiration:
#  - https://github.com/docker-library/mongo/blob/master/3.0/Dockerfile

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
    apt-get update && \
    apt-get install -y --force-yes pwgen mongodb-org=$MONGODB_VERSION mongodb-org-server=$MONGODB_VERSION mongodb-org-shell=$MONGODB_VERSION mongodb-org-mongos=$MONGODB_VERSION mongodb-org-tools=$MONGODB_VERSION && \
    echo "mongodb-org hold" | dpkg --set-selections && echo "mongodb-org-server hold" | dpkg --set-selections && \
    echo "mongodb-org-shell hold" | dpkg --set-selections && \
    echo "mongodb-org-mongos hold" | dpkg --set-selections && \
    echo "mongodb-org-tools hold" | dpkg --set-selections


# Create the MongoDB data directory
RUN mkdir -p /data/db
