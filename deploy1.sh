#!/bin/sh

. .kv_profile

$KVADMIN configure -name $NAME
$KVADMIN plan deploy-datacenter -name $DCNAME -rf $RF -wait
echo "data center $DCNAME deployed"
$KVADMIN plan deploy-sn -dc 1 -host $NODE1 -port $PORT -wait
echo "node-1 deployed to datacenter $DCNAME"
$KVADMIN plan deploy-admin -sn sn1 -port $HTTPPORT -wait
echo "admin service deployed on node-1"
$KVADMIN pool create -name $POOL
echo "Pool $POOL created"
$KVADMIN pool join -name $POOL -sn sn1
