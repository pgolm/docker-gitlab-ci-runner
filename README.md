# gitlab-ci-runner Dockerfile

Dockerfiles to build gitlab-ci-runner images

## Build
* Pull Baseimage
```
$ docker pull pgolm/docker-gitlab-ci-runner
```

or:

* Build by your own
```
$ docker build -t pgolm/docker-gitlab-ci-runner .
```

* Setup Runner plattform dependencies in Dockerfile.runner
* Build your runner
```
docker build -t runner - < Dockerfile.runner
```

## Start
Start your container:
```
docker run -d runner -e CI_SERVER_URL=https://ci.example.com -e REGISTRATION_TOKEN=token  -e GITLAB_SERVER_FQDN=gitlab.example.com
```