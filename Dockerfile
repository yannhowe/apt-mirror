FROM debian:10
COPY entrypoint.sh /opt/entrypoint.sh
RUN apt-get update -q \
  && \
    apt install -y -qq apt-mirror \
  && \
    apt-get autoremove \
  && \
    rm -rf /var/cache/apt/* \
  && \
    mkdir -p /mnt/mirror/debian \
  && \
    touch /var/log/cron.log \
  && \
    chmod u+x /opt/entrypoint.sh
COPY mirror.list /etc/apt/mirror.list
VOLUME ["/mnt/mirror/debian"]
ENTRYPOINT ["/opt/entrypoint.sh"]