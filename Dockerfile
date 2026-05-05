FROM golang:1.21 AS builder
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/star-39/moe-sticker-bot .
RUN go build -o moe-sticker-bot ./cmd/moe-sticker-bot/main.go

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    imagemagick libarchive-tools curl ffmpeg exiv2 gifsicle \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /app/moe-sticker-bot .
CMD ["/app/moe-sticker-bot", "--bot_token", "8253869774:AAHqS0bxvf0rizmcVGfhd_rMp-LG_qVlMWY"]
