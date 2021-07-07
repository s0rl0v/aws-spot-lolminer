#!/bin/bash
set -e -x

INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

curl -L https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.30/lolMiner_v1.30_Lin64.tar.gz > lol.tgz
tar xzvf lol.tgz && cd 1.30
sed -i 's/eth.2miners.com:2020/us1.ethermine.org:5555/g' mine_eth.sh
sed -i 's/0x155da78b788ab54bea1340c10a5422a8ae88142f/${wallet}/g' mine_eth.sh
sed -i "s/lolMinerWorker/$INSTANCE_ID/g" mine_eth.sh
sed -i 's/ETHASH/ETHASH --tls on/g' mine_eth.sh

./mine_eth.sh &
disown %1
