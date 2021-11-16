FROM node:10.14.1
RUN rm -f /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mkdir -p /home/iot \
    && groupadd -r iot \
    && useradd -r -g iot -d /home/iot -u 8080 iot \
    && usermod -a -G sudo iot \
    && usermod -a -G adm iot \
    && usermod -a -G staff iot \
    && chown -R iot:iot /home/iot \
    && echo "root:123456" | chpasswd

USER iot      
    
RUN cd /home/iot \
    &&  npm install nd-centre-cmd-gateway \
    &&  cd /home/iot/node_modules/nd-centre-cmd-gateway/data \
    &&  npm install \
    &&  cd /home/iot/node_modules/nd-centre-cmd-gateway \
    &&  npm install -g forever \
    &&  npm install
WORKDIR /home/iot/node_modules/nd-centre-cmd-gateway
EXPOSE 8080
CMD ["npm","run", "d101-iot-nr"]