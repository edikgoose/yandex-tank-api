FROM yandex/yandex-tank

WORKDIR /yandex-tank-api

ENV DEBIAN_FRONTEND noninteractive

RUN echo "net.ipv4.tcp_max_tw_buckets=65536" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_tw_recycle=1" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_tw_reuse=0" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_max_syn_backlog=131072" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_syn_retries=3" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_synack_retries=3" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_retries1=3" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_retries2=8" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_rmem=16384 174760 349520" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_wmem=16384 131072 262144" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_mem=262144 524288 1048576" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_max_orphans=65536" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_fin_timeout=10" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_low_latency=1" >> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_syncookies=0" >> /etc/sysctl.conf \

EXPOSE 8888/tcp

COPY yandex_tank_api ./yandex_tank_api
COPY yandex-tank-api-server-starter requirements.txt ./

RUN mkdir lock-dir && \
    mkdir output

RUN pip install -r requirements.txt

ENTRYPOINT ["python3", "yandex-tank-api-server-starter"]
