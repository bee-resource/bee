mkdir bee-node
mv bee bee-node/
mv bee.yaml bee-node/
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.12/bee-clef_0.4.12_amd64.rpm
rpm -i bee-clef_0.4.12_amd64.rpm
chmod +x bee
wget https://rpm.nodesource.com/setup_14.x
bash setup_14.x
yum install -y nodejs
npm install -g pm2
yum install -y jq
pm2 start bee.json
