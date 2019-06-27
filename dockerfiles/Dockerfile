FROM alpine:3.9
LABEL AUTOR="MARTIN VILCHE" PROYECTO="APACHE ZOOKEPER"
ENV ZOOKEEPER_URL=http://espejito.fder.edu.uy/apache/zookeeper/zookeeper-3.5.5/apache-zookeeper-3.5.5-bin.tar.gz
RUN apk add --update --no-cache gawk shadow openjdk8 bash curl && mkdir -p /opt/zookeeper /opt/zookeeper-data
RUN curl $ZOOKEEPER_URL --output /tmp/zookeeper.tgz && tar zxvf /tmp/zookeeper.tgz --strip-components 1 -C /opt/zookeeper && \
touch /opt/zookeeper/conf/zoo.cfg && rm -rf /tmp/zookeeper.tgz
COPY run.sh /usr/bin/run.sh
RUN adduser -D -H -u 1001 kafka && usermod -aG root kafka && chown kafka:0 -R /opt
USER 1001
EXPOSE 2181
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/zookeeper/conf/zoo.cfg"]
