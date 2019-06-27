FROM alpine:3.9
LABEL AUTOR="MARTIN VILCHE" PROYECTO="APACHE ZOOKEPER"
ENV ZOOKEEPER_URL=http://espejito.fder.edu.uy/apache/zookeeper/zookeeper-3.5.5/apache-zookeeper-3.5.5-bin.tar.gz
RUN apk add --update gawk openjdk8 bash curl && mkdir -p /opt/zookeeper /opt/zookeeper-data
RUN curl $ZOOKEEPER_URL --output /tmp/zookeeper.tgz && tar zxvf /tmp/zookeeper.tgz --strip-components 1 -C /opt/zookeeper && \
touch /opt/zookeeper/conf/zoo.cfg && chown 1001:1001 -R /opt/zookeeper /opt/zookeeper-data
COPY run.sh /usr/bin/run.sh
USER 1001
EXPOSE 2181
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/zookeeper/conf/zoo.cfg"]
