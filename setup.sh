#!/bin/bash
#remove stuff
systemctl stop webhook-handler.socket
systemctl stop webhook-handler.service
rm /run/webhook-handler.sk
#set up stuff
cp webhook-handler.service /etc/systemd/system/
cp webhook-handler.socket /etc/systemd/system/
cp nginx-config /etc/nginx/sites-enabled/webhook-handler
systemctl daemon-reload
systemctl start webhook-handler.socket
nginx -s reload

