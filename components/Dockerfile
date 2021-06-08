FROM alpine:3.13
COPY response /
ARG VERSION=not_set
ENV VERSION=${VERSION}
CMD echo ::set-output name=response::[${VERSION}] $(cat /response)