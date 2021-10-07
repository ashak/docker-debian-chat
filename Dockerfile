FROM debian:stable as builder
RUN apt-get update \
 && apt-get -y install build-essential git libicu-dev
RUN git clone https://github.com/kruton/tinyfugue.git \
 && cd tinyfugue \
 && apt-get install -y libgnutls28-dev libncurses5-dev libpcre3-dev pkg-config zlib1g-dev \
 && ./configure \
 && make \
 && make install

FROM ashak/debian-mosh
COPY --from=builder /usr/local/share/tf-lib /usr/local/share/tf-lib
COPY --from=builder /usr/local/bin/tf /usr/local/bin/tf5
RUN apt-get update \
 && apt-get -y install ca-certificates irssi \
 && rm -rf /var/lib/apt/lists/*
