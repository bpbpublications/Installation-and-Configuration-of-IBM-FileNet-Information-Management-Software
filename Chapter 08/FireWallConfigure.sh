firewall-cmd --zone=public --permanent --add-port 389/tcp
firewall-cmd --zone=public --permanent --add-port 636/tcp
firewall-cmd --zone=public --permanent --add-port=8001/tcp
firewall-cmd --zone=public --permanent --add-port 10248-10252/tcp
firewall-cmd --zone=public --permanent --add-port 30000-32767/tcp
firewall-cmd --zone=public --permanent --add-port 30000-32767/udp
firewall-cmd --zone=public --permanent --add-port=5601/tcp
firewall-cmd --zone=public --permanent --add-port=8001/tcp
firewall-cmd --zone=public --permanent --add-port=5044/tcp
firewall-cmd --zone=public --permanent --add-port=8080/tcp
firewall-cmd --zone=public --permanent --add-port=8443/tcp
firewall-cmd --zone=public --permanent --add-port=3306/tcp
firewall-cmd --zone=public --permanent --add-port=4567/tcp
firewall-cmd --zone=public --permanent --add-port=4568/tcp
firewall-cmd --zone=public --permanent --add-port=4444/tcp
firewall-cmd --zone=public --permanent --add-port=31443/tcp
firewall-cmd --zone=public --permanent --add-port=9443/tcp
firewall-cmd --zone=public --permanent --add-port=9083/tcp
firewall-cmd --zone=public --permanent --add-port=27017/tcp
firewall-cmd --zone=public --permanent --add-port=8445/tcp
firewall-cmd --zone=public --permanent --add-port=9100/tcp
firewall-cmd --zone=public --permanent --add-port=6969/tcp
firewall-cmd --zone=public --permanent --add-port=3100/tcp
firewall-cmd --zone=public --permanent --add-port=9100/tcp
firewall-cmd --zone=public --permanent --add-port=3000/tcp
firewall-cmd --zone=public --permanent --add-port=9090/tcp
firewall-cmd --zone=public --permanent --add-port=44134/tcp
firewall-cmd --zone=public --permanent --add-port=9093/tcp
firewall-cmd --zone=public --permanent --add-port=179/tcp
firewall-cmd --zone=public --permanent --add-port=9099/tcp
firewall-cmd --zone=public --permanent --add-port=9103/tcp
firewall-cmd --zone=public --permanent --add-port=9200/tcp
firewall-cmd --zone=public --permanent --add-port=9300/tcp
firewall-cmd --zone=public --permanent --add-port=9108/tcp
firewall-cmd --zone=public --permanent --add-port=2380/tcp
firewall-cmd --zone=public --permanent --add-port=4001/tcp
firewall-cmd --zone=public --permanent --add-port=24007/tcp
firewall-cmd --zone=public --permanent --add-port=24008/tcp
firewall-cmd --zone=public --permanent --add-port=2222/tcp
firewall-cmd --zone=public --permanent --add-port 49152-49251/tcp
firewall-cmd --zone=public --permanent --add-port=3000/tcp
firewall-cmd --zone=public --permanent --add-port=31031/tcp
firewall-cmd --zone=public --permanent --add-port=31030/tcp
firewall-cmd --zone=public --permanent --add-port=8500/tcp
firewall-cmd --zone=public --permanent --add-port=8600/tcp
firewall-cmd --zone=public --permanent --add-port=80/tcp
firewall-cmd --zone=public --permanent --add-port=443/tcp
firewall-cmd --zone=public --permanent --add-port=500/tcp
firewall-cmd --zone=public --permanent --add-port=500/udp
firewall-cmd --zone=public --permanent --add-port=4500/tcp
firewall-cmd --zone=public --permanent --add-port=31380/tcp
firewall-cmd --zone=public --permanent --add-port=31390/tcp
firewall-cmd --reload
