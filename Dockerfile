FROM        node:20-bullseye-slim

LABEL       author="Chaosdave34"

RUN         apt update \
            && apt -y --no-install-recommends install pkg-config python3-dev default-libmysqlclient-dev curl ffmpeg iproute2 git sqlite3 python3 pip tzdata ca-certificates dnsutils build-essential locales \
            && npm -g install npm@latest \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
