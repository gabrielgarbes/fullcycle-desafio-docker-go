FROM golang:alpine AS build_base

WORKDIR /usr/src/app

COPY app/ .

RUN go mod init app && \
    go build -o server .

FROM scratch

COPY --from=build_base /usr/src/app .

CMD ["./server" ]

