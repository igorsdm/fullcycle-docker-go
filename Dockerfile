FROM golang:latest AS builder

WORKDIR /usr/goapp

COPY hello.go .

RUN go mod init hello && go build


FROM scratch

WORKDIR /

COPY --from=builder /usr/goapp .

ENTRYPOINT ["./hello"]

