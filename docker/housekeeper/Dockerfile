FROM alpine:3.15

RUN apk add curl jq nextcloud-sqlite openssh \
    && mkdir -p /housekeeper/env /root/.ssh

COPY scripts/ripe-bgp-telemach scripts/mtik-backup scripts/nextcloud-me /etc/periodic/monthly/
COPY scripts/mtik-v6-lts-update scripts/mtik-dhcplease /etc/periodic/weekly/
COPY ./conf/id_rsa /root/.ssh/id_rsa
COPY ./conf/ssh-client-config /root/.ssh/config

RUN chmod 400 /root/.ssh/id_rsa

ENTRYPOINT [ "/usr/bin/tail" ]
CMD [ "-f", "/proc/net/stat/nf_conntrack" ]