#! /bin/sh
os=`uname -s`
if test $os = "Darwin" ; then
    echo "Darwin"
    sysctl -w net.inet.ip.forwarding=1
fi

if test $os = "Linux" ; then
    echo "Linux"
    echo "1" > /proc/sys/net/ipv4/ip_forward
fi

pwd_dir=`pwd`
config_file="${pwd_dir}/prometheus.yml"

alert_manager_ip=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' alertmanager`

docker run -d --name prometheus -p 9090:9090 \
 -v $pwd_dir:/prometheus-conf \
 prom/prometheus:v1.7.1 \
 -config.file=/prometheus-conf/prometheus.yml \
 -alertmanager.url=http://$alert_manager_ip:9093
