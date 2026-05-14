FROM ghcr.io/star-39/moe-sticker-bot:latest
USER root
RUN apt-get update && apt-get install -y exiv2 && rm -rf /var/lib/apt/lists/*
CMD ["/moe-sticker-bot", "--bot_token", "8253869774:AAHqS0bxvf0rizmcVGfhd_rMp-LG_qVlMWY"]
