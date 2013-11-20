# gitlab-ci-runner Dockerfile

## Build
* Setup the ENV's & deps in ```Dockerfile.example```
* Build Container:
```
docker build -t my/runner:tag - < Dockerfile.example
```

## Start
Start your container:
```
docker run -d my/runner:tag
```