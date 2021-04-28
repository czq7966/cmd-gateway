cd /data
#### install node and npm
#arm71
wget https://npm.taobao.org/mirrors/node/v14.16.1/node-v14.16.1-linux-armv7l.tar.xz
tar -xvf node-v14.16.1-linux-armv7l.tar.xz
mv node-v14.16.1-linux-armv7l node-v14.16.1

#x64
#wget https://npm.taobao.org/mirrors/node/v14.16.1/node-v14.16.1-linux-x64.tar.xz
#tar -xvf node-v14.16.1-linux-x64.tar.xz
#mv node-v14.16.1-linux-x64 node-v14.16.1

# install mDNS dependency
#sudo apt-get install avahi-daemon
#sudo apt-get install libavahi-compat-libdnssd-dev




#在/etc/environment 加入 :/data/node-v14.16.1/bin

#### config
# set PATH
export PATH=$PATH:/data/node-v14.16.1/bin
# set npm use root
npm config -g set unsafe-perm=true
# set npm use taobao mirror
npm config set registry https://registry.npm.taobao.org





#### install mqtt-server
cd /data
#git clone http://761208@172.24.132.179/a/app-cpp/local-iot mqtt-server -b mqtt-server
git clone http://761208@gerrit.sdp.nd/a/app-cpp/local-iot mqtt-server -b mqtt-server

cd /data/mqtt-server
npm install


#### install cmd gateway
cd /data
#ssh download
#git clone ssh://761208@gerrit.sdp.nd:29418/app-cpp/local-iot cmd-gateway -b cmd-gateway

#http download
git clone http://761208@gerrit.sdp.nd/a/app-cpp/local-iot cmd-gateway -b cmd-gateway



cd /data/cmd-gateway
npm install
cd /data/cmd-gateway/data
npm install

#cd /data/cmd-gateway
#npm start


# auto start
# see https://blog.csdn.net/sayyy/article/details/79276575
cp cmd-gateway.service /lib/systemd/system/cmd-gateway.service
systemctl enable cmd-gateway
systemctl list-unit-files|grep cmd-gateway

cp mqtt-server.service /lib/systemd/system/mqtt-server.service
systemctl enable mqtt-server
systemctl list-unit-files|grep mqtt-server