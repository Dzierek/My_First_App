#!/bin/bash
sudo yum update -y
sudo yum install python3 python3-pip -y
sudo pip3 install flask
cd /home/ec2-user/app
pkill -f gunicorn || true
nohup gunicorn -w 2 -b 0.0.0.0:5000 app:app &
