FROM golang:1.14-alpine AS builder

WORKDIR /go/src/app

COPY . .
RUN go build && go install

FROM scratch
WORKDIR /go/src/app
COPY --from=builder /go/src/app .

ENTRYPOINT ["app"]
