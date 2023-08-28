# HELLO , this is a guide to get started with this project 

## installations needed
- mongodb
- sysbench-mongodb from https://github.com/tmcallaghan/sysbench-mongodb (NOTE: you need to install java drivers)

## getting started
- run the start_mongodb_cluster.sh using the command `./start_mongodb_cluster` before that make sure it is an executable with the command `chomon +x start_mongodb_cluster.sh`
- then run the sysbench using the command `./run.simple.bash` before that make sure it is an executable with the command `chomon +x run.simple.bash.sh`

## stopping cluster
- run the stop_mongodb_cluster.sh using the command `./stop_mongodb_cluster` before that make sure it is an executable with the command `chomon +x stop_mongodb_cluster.sh`
