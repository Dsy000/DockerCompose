#!/bin/bash

# Start Zookeeper
/opt/zookeeper/bin/zkServer.sh start

# Wait for Zookeeper to start
while ! nc -z localhost 2181; do   
  sleep 1
done

# Start Nimbus
/opt/storm/bin/storm nimbus &
sleep 5

# Start Supervisor
/opt/storm/bin/storm supervisor &
sleep 5

# Start UI
/opt/storm/bin/storm ui &
sleep 5

# Keep the container running
tail -f /dev/null
