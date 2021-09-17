# change dns
# vi /etc/resolv.conf
# change nameserver value to 8.8.8.8


#### install node and npm
#arm71
mkdir /data
cd /data
wget https://npm.taobao.org/mirrors/node/v14.16.1/node-v14.16.1-linux-armv7l.tar.xz
tar -xvf node-v14.16.1-linux-armv7l.tar.xz
ln -s node-v14.16.1-linux-armv7l node

#mv node-v14.16.1-linux-armv7l node-v14.16.1


#x64
#wget https://npm.taobao.org/mirrors/node/v14.16.1/node-v14.16.1-linux-x64.tar.xz
#tar -xvf node-v14.16.1-linux-x64.tar.xz
#ln -s node-v14.16.1-linux-x64 node


# install mDNS dependency
apt-get update
sudo apt-get install avahi-daemon libavahi-compat-libdnssd-dev




#vi /etc/resolv.conf  加入 192.168.9.35
#在/etc/environment 加入 :/data/node/bin
vi /etc/environment 加入 :/data/node/bin
echo  "export PATH=\$PATH:/data/node/bin" >> /etc/profile

#### config
# set PATH
# set npm use root
# set npm use taobao mirror

export PATH=$PATH:/data/node/bin
npm config -g set unsafe-perm=true
npm config set registry https://registry.npm.taobao.org







#### install mqtt-server

#git clone ssh://761208@gerrit.sdp.nd:29418/app-cpp/local-iot mqtt-server -b mqtt-server

# git clone http://761208@gerrit.sdp.nd/a/app-cpp/local-iot mqtt-server -b mqtt-server
cd /data
git clone https://github.com/czq7966/cmd-gateway mqtt-server -b mqtt-server


cd /data/mqtt-server
npm install


#### install cmd gateway
# cd /data
# git clone http://761208@gerrit.sdp.nd/a/app-cpp/local-iot cmd-gateway -b cmd-gateway
#ssh download
#git clone ssh://761208@gerrit.sdp.nd:29418/app-cpp/local-iot cmd-gateway -b cmd-gateway

#http download

cd /data
git clone https://github.com/czq7966/cmd-gateway cmd-gateway -b cmd-gateway


 
cd /data/cmd-gateway
npm install
cd /data/cmd-gateway/data
npm install

#cd /data/cmd-gateway
#npm start


# auto start
# see https://blog.csdn.net/sayyy/article/details/79276575

cd /data/cmd-gateway
cp mqtt-server.service /lib/systemd/system/mqtt-server.service
systemctl enable mqtt-server
systemctl list-unit-files|grep mqtt-server
systemctl start mqtt-server

cd /data/cmd-gateway
cp cmd-gateway.service /lib/systemd/system/cmd-gateway.service
systemctl enable cmd-gateway
systemctl list-unit-files|grep cmd-gateway
systemctl start cmd-gateway

#更新服务
systemctl daemon-reload


# 从GitHub上安装----------------------------------------------------------

mkdir /data
cd /data
wget https://npm.taobao.org/mirrors/node/v14.16.1/node-v14.16.1-linux-armv7l.tar.xz
tar -xvf node-v14.16.1-linux-armv7l.tar.xz
ln -s node-v14.16.1-linux-armv7l node

echo  "export PATH=\$PATH:/data/node/bin" >> /etc/profile

export PATH=$PATH:/data/node/bin
npm config -g set unsafe-perm=true
npm config set registry https://registry.npm.taobao.org

cd /data
git clone https://github.com/czq7966/cmd-gateway mqtt-server -b mqtt-server

cd /data
git clone http://github.com/czq7966/cmd-gateway cmd-gateway -b cmd-gateway 

cd /data/mqtt-server
npm install

cd /data/cmd-gateway
npm install
cd /data/cmd-gateway/data
npm install

cd /data/cmd-gateway
cp mqtt-server.service /lib/systemd/system/mqtt-server.service
systemctl enable mqtt-server
systemctl list-unit-files|grep mqtt-server
systemctl start mqtt-server
systemctl status mqtt-server -l

cd /data/cmd-gateway
cp cmd-gateway.service /lib/systemd/system/cmd-gateway.service
systemctl enable cmd-gateway
systemctl list-unit-files|grep cmd-gateway
systemctl start cmd-gateway
systemctl status cmd-gateway -l


# 从共享平台复制Node-red----------------------------------------------------------
cd /
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/node-red.tar.gz
tar -xvf node-red.tar.gz

cd /data

ln -s node-v14.16.1-linux-armv7l node
echo  "export PATH=\$PATH:/data/node/bin" >> /etc/profile
export PATH=$PATH:/data/node/bin
npm config -g set unsafe-perm=true
npm config set registry https://registry.npm.taobao.org


cd /data/cmd-gateway
cp mqtt-server.service /lib/systemd/system/mqtt-server.service
systemctl enable mqtt-server
systemctl list-unit-files|grep mqtt-server
systemctl start mqtt-server
systemctl status mqtt-server -l

cd /data/cmd-gateway
cp cmd-gateway.service /lib/systemd/system/cmd-gateway.service
systemctl enable cmd-gateway
systemctl list-unit-files|grep cmd-gateway
systemctl start cmd-gateway
systemctl status cmd-gateway -l



# 安装ser2sock
cd /data
git clone https://github.com/nutechsoftware/ser2sock.git
cd /data/ser2sock
mv config.h.in config.h
cc -o ser2sock ser2sock.c
sudo nano /etc/init.d/ser2sock
# 复制粘贴文件内容： /service/ser2sock.service
sudo chmod 755 /etc/init.d/ser2sock
sudo update-rc.d ser2sock defaults
systemctl enable ser2sock
systemctl list-unit-files|grep ser2sock
systemctl start ser2sock
systemctl status ser2sock -l

#安装JDK
mkdir /data
mkdir /data/jdk
cd /data/jdk
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/jdk/jdk-8u91-linux-arm32-vfp-hflt.tar.gz
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/jdk/jdk-7u75-linux-arm-vfp-hflt.tar.gz
tar -xvf jdk-8u91-linux-arm32-vfp-hflt.tar.gz
tar -xvf jdk-7u75-linux-arm-vfp-hflt.tar.gz


# 安装CGate
mkdir /data
mkdir /data/cgate
cd /data/cgate
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/cgate/cgate_2_11_3_3249.zip
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/cgate/cgate_2_10_6_3145.zip
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/cgate/cgate_2_9_8_3077.zip
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/cgate/cgate_2_8_0_2316.zip
wget http://betacs.101.com/v0.1/static/preproduction_content_ndcast_ota/iot/cgate/cgate_2_8_0_2303.zip

unzip cgate_2_11_3_3249.zip
unzip cgate_2_10_6_3145.zip
unzip cgate_2_9_8_3077.zip
unzip cgate_2_8_0_2316.zip
unzip cgate_2_8_0_2303.zip

echo -e "\nremote 192.168.255.255 Program" >> cgate_2_11_3_3249/config/access.txt
echo -e "\nremote 192.168.255.255 Program" >> cgate_2_10_6_3145/config/access.txt
echo -e "\nremote 192.168.255.255 Program" >> cgate_2_9_8_3077/config/access.txt
echo -e "\nremote 192.168.255.255 Program" >> cgate_2_8_0_2316/config/access.txt
echo -e "\nremote 192.168.255.255 Program" >> cgate_2_8_0_2303/config/access.txt

#sudo rm /etc/init.d/cgate
#sudo nano /etc/init.d/cgate
sudo vi /lib/systemd/system/cgate.service
# 复制粘贴文件内容： /service/cgate.service
systemctl daemon-reload
systemctl enable cgate
systemctl list-unit-files|grep cgate
systemctl stop cgate
systemctl start cgate
systemctl status cgate -l
