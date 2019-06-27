#!/bin/bash

set -e
echo "···································································································"
echo "MARTIN FABRIZZIO VILCHE - https://github.com/mvilche"
echo "···································································································"

ID=$(echo $RANDOM | tr -dc 0-9 | cut -c 1-3)

cat << EOF >  /opt/zookeeper/conf/zoo.cfg
tickTime=2000
dataDir=/opt/zookeeper-data
clientPort=2181
initLimit=5
syncLimit=2
server.$ID=0.0.0.0:2888:3888
EOF
cat /opt/zookeeper/conf/zoo.cfg

echo "···································································································"
echo "INICIANDO ZOOKEEPER........."
exec /opt/zookeeper/bin/zkServer.sh start-foreground "$@"
