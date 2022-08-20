FROM alpine:3.16

RUN apk add curl jq nextcloud-sqlite openssh bash s6 \
    && mkdir -p /housekeeper/env /root/.ssh

COPY scripts/ripe-bgp-telemach scripts/mtik-backup scripts/nextcloud-me /etc/periodic/monthly/
COPY scripts/mtik-v6-lts-update scripts/mtik-dhcplease /etc/periodic/weekly/
COPY ./conf/id_rsa /root/.ssh/id_rsa
COPY ./conf/ssh-client-config /root/.ssh/config

RUN chmod 400 /root/.ssh/id_rsa

ENTRYPOINT [ "/usr/sbin/crond" ]
CMD [ "-f" ]
