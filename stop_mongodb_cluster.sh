#!/bin/bash

# Stop MongoDB instances
mongod --dbpath mongodb_cluster/data/db1 --shutdown
mongod --dbpath mongodb_cluster/data/db2 --shutdown
mongod --dbpath mongodb_cluster/data/db3 --shutdown

# # Remove data directories
# rm -r mongodb_cluster/data

# # Remove configuration files
# rm mongodb_cluster/mongod1.conf
# rm mongodb_cluster/mongod2.conf
# rm mongodb_cluster/mongod3.conf

echo "MongoDB instances stopped and data directories removed."
