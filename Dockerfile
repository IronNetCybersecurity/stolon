ARG GOLANG_VERSION=1.11.5
FROM 217386048230.dkr.ecr.us-east-1.amazonaws.com/go:${GOLANG_VERSION}

ADD / /stolon/

RUN cd stolon \
    && STOLON_VERSION=ironnet ./build

FROM debian:stretch-slim

COPY --from=0 /stolon/bin /usr/local/bin