FROM mono:latest

MAINTAINER Paul Krizak <paul.krizak@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -q update && \
    apt-get install -qy p7zip-full ffmpeg libmono-sharpzip* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

ADD [ "https://github.com/nmaier/simpleDLNA/releases/download/v1.0/simpledlna-1.0.7z", "simpledlna.7z" ]

RUN 7z x simpledlna.7z && rm -f simpledlna.7z

EXPOSE 39200 1900
VOLUME [ "/images", "/cache" ]

ENTRYPOINT [ "mono", "sdlna.exe", "--cache=/cache/sdlna.sqlite", "--port=39200", "--type=image", "/images" ]

