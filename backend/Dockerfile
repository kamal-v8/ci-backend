FROM  golang:1.26.2-alpine AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download 

COPY . . 

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:latest

RUN adduser -D appuser

USER appuser

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8000

CMD ["./main"]
