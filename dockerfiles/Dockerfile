FROM alpine:3.9
LABEL AUTOR="MARTIN VILCHE" PROYECTO="APACHE ZOOKEPER"
ENV ZOOKEEPER_URL=http://espejito.fder.edu.uy/apache/zookeeper/zookeeper-3.5.5/apache-zookeeper-3.5.5-bin.tar.gz
RUN apk add --update --no-cache gawk shadow openjdk8 bash curl && mkdir -p /opt/zookeeper /opt/zookeeper-data
RUN curl $ZOOKEEPER_URL --output /tmp/zookeeper.tgz && tar zxvf /tmp/zookeeper.tgz --strip-components 1 -C /opt/zookeeper && \
touch /opt/zookeeper/conf/zoo.cfg && rm -rf /tmp/zookeeper.tgz
COPY run.sh /usr/bin/run.sh
RUN adduser -D kafka && usermod -aG root kafka && chown -R kafka:0 /opt /home/kafka && chmod -R 0775 /opt /home/kafka
USER kafka
EXPOSE 2181
ENV HOME /home/kafka
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/zookeeper/conf/zoo.cfg"]
