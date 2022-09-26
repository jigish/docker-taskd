ARG UBUNTU_VERSION

FROM ubuntu:${UBUNTU_VERSION}

ARG TASKD_VERSION
ENV TASKD_VERSION ${TASKD_VERSION}

RUN apt-get update && apt-get install --no-install-recommends -y "taskd=${TASKD_VERSION}" && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/taskd"]
EXPOSE 53589
ENTRYPOINT ["taskd", "server", "--data", "/var/taskd"]
