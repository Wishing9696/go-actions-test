FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o /app/main ./server 

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/main /app/main

EXPOSE 8080
ENV PORT=8080
CMD ["/app/main"]