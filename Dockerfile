FROM ubuntu:14.04
MAINTAINER Tim Haak <tim@haak.co.uk>

ENV SICKRAGE_VERSION master

RUN apt-get -q update && \
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl unrar-free  && \
    curl -L https://github.com/SiCKRAGETV/SickRage/tarball/${SICKRAGE_VERSION} -o sickrage.tgz && \
    tar -xvf sickrage.tgz -C /  &&\
    mv /SiCKRAGETV-SickRage-* /sickrage/ &&\
    rm  /sickrage.tgz &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
