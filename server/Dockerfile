FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .
# RUN go mod init && go mod tidy
RUN go mod init ./server && go mod tidy

# Build the Go app
# Use CGO_ENABLED=0 to build a statically linked binary
# Use GOOS=linux to build for Linux
# Use -o to specify the output binary name
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/main . 

# Use a smaller base image for the final image
# Use alpine as the base image
# Copy the binary from the builder stage to the final stage
# Expose port 8080 and set the environment variable PORT to 8080
# Set the entrypoint to the binary name
# CMD ["/app/main"]
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/main /app/main

EXPOSE 8080
ENV PORT=8080
CMD ["/app/main"]