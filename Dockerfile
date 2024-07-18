FROM ashak/debian-mosh
RUN apt-get update \
 && apt-get -y install ca-certificates irssi tf5 wget \
 && wget -O /usr/local/bin/muddler https://raw.githubusercontent.com/c-hudson/muddler/master/muddler \
 && apt-get -y autoremove --purge wget \
 && chmod a+x /usr/local/bin/muddler \
 && muddler --install \
 && rm -rf /var/lib/apt/lists/*
