FROM ubuntu:latest
WORKDIR /src
VOLUME /src

ENV RUNTIME_USER_GUID 1000
ENV LIBNX_DEVKITA64_URL https://raw.githubusercontent.com/devkitPro/installer/master/perl/devkitA64update.pl

# Install dependencies and add default runtime user.
# Install shared application build dependencies.
RUN apt-get update && \
    apt-get install -y wget build-essential && \
    groupadd --gid ${RUNTIME_USER_GUID} app && \
    useradd -m -u ${RUNTIME_USER_GUID} -g ${RUNTIME_USER_GUID} app && \
    chown app:app /src/

# libnx
ENV DEVKITPRO /opt/devkitpro
ENV DEVKITA64 /opt/devkitpro
RUN apt-get install -y xz-utils lbzip2 unzip && \
    mkdir /opt/devkitpro && chown app:app /opt/devkitpro

# Install libnx.
# http://switchbrew.org/index.php?title=Setting_up_Development_Environment
RUN mkdir /tmp/devkitpro/ && cd /tmp/devkitpro/ && \
    wget -q -O devkit.pl ${LIBNX_DEVKITA64_URL}
RUN cd /tmp/devkitpro/ && chmod +x ./devkit.pl && ./devkit.pl /opt/devkitpro

# Switch the current context to the runtime user.
USER app

CMD ["make"]