#!/bin/bash

echo "OB_HOME=$OB_HOME"
echo "-stage=$1"
echo "-rate=$2"
echo "-size=${3:-1kb}"

if [ -z "$OB_HOME" ]
  then
    echo "No environment supplied: 'OB_HOME' is not set"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "No argument supplied: run-benchmark.sh [stage] [rate] ([size])"
    exit 1
fi

cd $OB_HOME;

sudo $OB_HOME/bin/benchmark \
  --drivers $OB_HOME/driver-kafka/kafka-$1.yaml \
  $OB_HOME/workloads/1-topic-1-partition-$2-rate-${3:-1kb}.yaml >> $OB_HOME/logs/$1/1-topic-1-partition-$2-rate-${3:-1kb}-$(date '+%Y-%m-%dT%H:%M:%S').log