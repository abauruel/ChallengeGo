FROM golang:1.14 AS builder

WORKDIR /go/src/app

COPY . .
RUN go build -ldflags "-s -w" 

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app .
ENTRYPOINT ["./app"]
