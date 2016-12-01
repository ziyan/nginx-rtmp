# nginx-rtmp-docker
Minimal RTMP Server in Docker. Built with a static nginx binary to minimize image size.

## Install

```
docker pull ziyan/nginx-rtmp:latest
```

## Run

```
docker run -p 1935:1935 ziyan/nginx-rtmp:latest
```

## Build

```
make
```
