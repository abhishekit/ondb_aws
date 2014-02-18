#!/bin/sh
. .kv_profile

$KVADMIN plan deploy-sn -dc 1 -host $NODE2 -port $PORT -wait
echo "node-2 deployed to datacenter $DCNAME"
sleep 5
$KVADMIN plan deploy-sn -dc 1 -host $NODE3 -port $PORT -wait
echo "node-3 deployed to datacenter $DCNAME"
$KVADMIN pool join -name $POOL -sn sn2
echo "node-2 added to pool $POOL"
$KVADMIN pool join -name $POOL -sn sn3
echo "node-3 added to pool $POOL"
$KVADMIN topology create -name $TOPO -pool $POOL -partitions $PARTITIONS
echo "topology $TOPO created with $PARTITIONS partitions"
$KVADMIN plan deploy-topology -name $TOPO -wait
echo "topology $TOPO deployed"
