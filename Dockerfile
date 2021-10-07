FROM debian:stable as builder
RUN apt-get update \
 && apt-get -y install apt-src
RUN echo "deb-src http://ftp.uk.debian.org/debian/ stable main contrib non-free" >> /etc/apt/sources.list \
 && echo "deb-src http://deb.debian.org/debian-security/ stable-security main contrib non-free" >> /etc/apt/sources.list \
 && echo "deb-src http://deb.debian.org/debian stable-updates main contrib non-free" >> /etc/apt/sources.list \
 && apt-src update \
 && apt-src install tf5 \
 && apt-src build tf5 \
 && ls

FROM ashak/debian-mosh
COPY --from=builder /tf5_5.0beta8-*_*.deb /
RUN apt-get update \
 && apt-get -y install ca-certificates irssi \
 && apt-get -y install /tf5_5.0beta8-*_*.deb \
 && rm -rf /var/lib/apt/lists/*
