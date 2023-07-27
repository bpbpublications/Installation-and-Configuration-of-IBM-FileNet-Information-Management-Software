#!/bin/bash
#
systemctl start firewalld 
systemctl enable firewalld
firewall-cmd --add-service=nfs
firewall-cmd --add-service=rpc-bind
firewall-cmd --add-service=mountd
firewall-cmd --zone=public --permanent --add-port=8191/tcp
firewall-cmd –reload
