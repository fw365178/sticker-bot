FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    imagemagick libarchive-tools curl ffmpeg exiv2 gifsicle wget \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN wget https://github.com/star-39/moe-sticker-bot/releases/download/v2.4.2/moe-sticker-bot_linux_amd64 -O moe-sticker-bot \
    && chmod +x moe-sticker-bot
CMD ["/app/moe-sticker-bot", "--bot_token", "8253869774:AAHqS0bxvf0rizmcVGfhd_rMp-LG_qVlMWY"]
