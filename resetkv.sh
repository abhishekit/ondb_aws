#!/bin/sh

. .kv_profile

rm -rf $KVROOT
mkdir $KVHOME/kvroot
java -jar $KVHOME/lib/kvstore.jar makebootconfig -root $KVROOT -host $NODE1 -port $PORT -admin $HTTPPORT -harange 5010,5020 -capacity $CAP -memory_mb $MEMORY 
