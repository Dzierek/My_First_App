#!/bin/bash
cd /home/ec2-user/app
pkill -f gunicorn || true
nohup gunicorn -w 2 -b 0.0.0.0:5000 app:app &
