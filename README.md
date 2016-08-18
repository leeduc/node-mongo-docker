## Node + MongoDB Container
This is a Docker container with both Node and MongoDB installed.

### Why?
[BitBucket Pipelines does not yet support running multiple Docker containers](https://bitbucket.org/site/master/issues/12757/ability-to-run-multiple-docker-containers), so to be able to run Node.js + MongoDB integration tests this container was built.

Link to BitBucket issue: https://bitbucket.org/site/master/issues/12757/ability-to-run-multiple-docker-containers


### I don't use Node 0.12 or MongoDB 2.6...
The Dockerfile should be easy enough to modify for your requirements.
