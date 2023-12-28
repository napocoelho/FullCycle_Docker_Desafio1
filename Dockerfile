FROM ubuntu:latest AS builder

COPY hello.go ./

RUN apt-get update && \
    apt-get install golang -y && \
    apt-get install bash -y && \
    go build hello.go



FROM scratch

COPY --from=builder hello ./

ENTRYPOINT ["./hello" ]
