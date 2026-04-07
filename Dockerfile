FROM golang:1.23-alpine
WORKDIR /app

RUN apk add --no-cache git && go mod tidy && go build -o trading-bot ./cmd/bot
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the rest of the source code
COPY . .

RUN go build -o trading-bot ./cmd/bot
CMD ["./trading-bot"]