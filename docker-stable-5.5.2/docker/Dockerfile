
FROM debian:trixie

##### zsteva/debian-user Dockerfile

ARG USER=user
ARG GROUP=user
ARG USER_ID=1000
ARG GROUP_ID=1000

ENV CONFIG_USER=${USER}
ENV CONFIG_USER_ID=${USER_ID}
ENV CONFIG_GROUP=${GROUP}
ENV CONFIG_GROUP_ID=${GROUP_ID}

RUN sed -i -e 's/^Components:.*$/Components: main contrib non-free/' \
    /etc/apt/sources.list.d/debian.sources

RUN export DEBIAN_FRONTEND=noninteractive ; \
    apt-get update \
    && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=en_US.utf8

RUN export DEBIAN_FRONTEND=noninteractive ; \
    apt-get update -y -q \
    && apt-get install -y -q sudo vim screen curl less wget net-tools zip libxslt-dev python3 iputils-ping bind9-host procps \
	&& groupadd -g ${CONFIG_GROUP_ID} ${CONFIG_GROUP} \
	&& useradd -s /bin/bash -u ${CONFIG_USER_ID} -g ${CONFIG_GROUP} -m ${CONFIG_USER} \
	&& echo "${CONFIG_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* && apt-get clean

##### end zsteva/debian-user Dockerfile

####  esp-idf

RUN export DEBIAN_FRONTEND=noninteractive ; \
    apt-get update -y -q \
    && apt-get install -y -q git build-essential tio libusb-1.0-0 python3.13-venv python3-dev cmake \
    && rm -rf /var/lib/apt/lists/* && apt-get clean

ARG VERSION=5.5.2

ENV IDF_TOOLS_PATH="/opt/espressif32-${VERSION}"
ENV IDF_PATH=${IDF_TOOLS_PATH}/esp-idf

RUN mkdir -p ${IDF_TOOLS_PATH} \
    && cd ${IDF_TOOLS_PATH} \
    && git clone -b "v${VERSION}" --recursive https://github.com/espressif/esp-idf.git

RUN cd ${IDF_PATH} \
    && XPYTHON=python3 \
    && ./install.sh all

RUN EXPFILE=$(python3 "${IDF_PATH}/tools/activate.py" --export --shell bash 2> /dev/null | sed -e 's/^\.\s*//') \
    && cp "$EXPFILE" "${IDF_TOOLS_PATH}/bash-env.sh" \
    && chmod 0644 "${IDF_TOOLS_PATH}/bash-env.sh"

COPY docker-entrypoint.sh /usr/local/bin

RUN chown 0:0 /usr/local/bin/docker-entrypoint.sh \
    && chmod 0755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

USER ${CONFIG_USER}

WORKDIR /home/${CONFIG_USER}

CMD ["/bin/bash"]

