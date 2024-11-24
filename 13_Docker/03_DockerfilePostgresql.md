# Dockerfile for PostgreSQL

```sh
# pull base image.
FROM ubuntu:18.04

LABEL version="1.0"
LABEL description="postgresql"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y apt-utils

RUN groupadd -r postgres --gid=999 \
    && useradd -r -g postgres --uid=999 postgres \
    && mkdir /home/postgres \
    && chown postgres:postgres /home/postgres \
    && apt-get install -qy postgresql 

ENV PATH $PATH:/usr/lib/postgresql/$PG_MAJOR/bin

EXPOSE 5432
# CMD ["postgres"]
```
