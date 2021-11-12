#!/bin/sh

while :
do
    connected=0
    gateways=`route -n | grep UG | awk '{print $2}'`

    if [ -z "$gateways" ];then
        echo "not gateway, restart..."
        systemctl restart network-manager.service
        echo "network restarted"
    else
        for gateway in $gateways
        do
            echo $gateway
            ping -c 3 $gateway > /dev/null 2>&1
            temp=$?
            if [ $temp -eq 0 ];then
                connected=1
                echo "connected"
            else
                #connected=0
                echo "disconnected"
            fi
        done

        if [ $connected -eq 1 ];then
            echo "network is connected"
        else
            echo "network is not connected, restart..."
            systemctl restart network-manager.service
            echo "network restarted"
        fi
    fi
    sleep 90
done