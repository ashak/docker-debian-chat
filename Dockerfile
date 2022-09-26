FROM ashak/debian-mosh
RUN apt-get update \
 && apt-get -y install ca-certificates irssi tf5 \
 && rm -rf /var/lib/apt/lists/*
