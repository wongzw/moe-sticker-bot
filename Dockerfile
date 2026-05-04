FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    imagemagick \
    libarchive-tools \
    gifsicle \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/star-39/moe-sticker-bot:latest /moe-sticker-bot /moe-sticker-bot

ADD https://raw.githubusercontent.com/star-39/moe-sticker-bot/master/tools/msb_emoji.py /usr/local/bin/msb_emoji.py
ADD https://raw.githubusercontent.com/star-39/moe-sticker-bot/master/tools/msb_kakao_decrypt.py /usr/local/bin/msb_kakao_decrypt.py
ADD https://raw.githubusercontent.com/star-39/moe-sticker-bot/master/tools/msb_rlottie.py /usr/local/bin/msb_rlottie.py

RUN chmod +x /usr/local/bin/msb_*.py && \
    pip3 install emoji rlottie-python --break-system-packages
