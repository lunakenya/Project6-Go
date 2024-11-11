# Use the official Go base image
FROM golang:1.19-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy project files to the working directory inside the container
COPY . .

# Download dependencies and build the project without recreating the go.mod file
RUN go mod tidy && \
    go build -o my-go-web-app

# Use a minimal Alpine image to reduce the final image size
FROM alpine:latest

# Copy the executable from the build image
COPY --from=builder /app/my-go-web-app /my-go-web-app

# Define the port on which the application will listen
EXPOSE 8089

# Command to run the application
CMD ["/my-go-web-app"]
