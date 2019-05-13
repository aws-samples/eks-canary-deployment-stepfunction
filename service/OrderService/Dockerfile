FROM golang:alpine AS builder

RUN apk add --no-cache make git

WORKDIR /go/src/myapp.github.com

COPY . .

RUN make build-linux

FROM alpine

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/myapp.github.com/myapp .

EXPOSE 8080

CMD ["./myapp"]