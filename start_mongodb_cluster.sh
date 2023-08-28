#!/bin/bash

# Create data directories
mkdir -p mongodb_cluster/data/db1 mongodb_cluster/data/db2 mongodb_cluster/data/db3

# Write configuration files
cat <<EOT > mongodb_cluster/mongod1.conf
storage:
  dbPath: "mongodb_cluster/data/db1"
  journal:
    enabled: true

net:
  bindIp: 127.0.0.1
  port: 27001

replication:
  replSetName: "rs0"
EOT

cat <<EOT > mongodb_cluster/mongod2.conf
storage:
  dbPath: "mongodb_cluster/data/db2"
  journal:
    enabled: true

net:
  bindIp: 127.0.0.1
  port: 27002

replication:
  replSetName: "rs0"
EOT

cat <<EOT > mongodb_cluster/mongod3.conf
storage:
  dbPath: "mongodb_cluster/data/db3"
  journal:
    enabled: true

net:
  bindIp: 127.0.0.1
  port: 27003

replication:
  replSetName: "rs0"
EOT

# Start MongoDB instances
mongod --config mongodb_cluster/mongod1.conf --fork --logpath mongodb_cluster/mongod1.log
mongod --config mongodb_cluster/mongod2.conf --fork --logpath mongodb_cluster/mongod2.log
mongod --config mongodb_cluster/mongod3.conf --fork --logpath mongodb_cluster/mongod3.log


# Wait for MongoDB instances to start
sleep 5

# Connect to one of the MongoDB instances and initiate the replica set
mongosh --port 27001 <<EOF
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "127.0.0.1:27001" },
    { _id: 1, host: "127.0.0.1:27002" },
    { _id: 2, host: "127.0.0.1:27003" }
  ]
})
EOF

echo "MongoDB instances started, rs0 set initiated, and admin user created."