FROM timhaak/base:latest
MAINTAINER tim@haak.co.uk

ENV SICKRAGE_VERSION="master"

RUN apt-get -q update && \
    apt-get install -qy --force-yes python-cheetah python-openssl && \
    curl -L https://github.com/SiCKRAGETV/SickRage/tarball/${SICKRAGE_VERSION} -o sickrage.tgz && \
    tar -xvf sickrage.tgz -C /  && \
    mv /SiCKRAGETV-SickRage-* /sickrage/ && \
    rm  /sickrage.tgz && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

VOLUME ["/config", "/data"]

EXPOSE 8081

CMD ["/start.sh"]
