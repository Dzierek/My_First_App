#!/bin/bash
yum update -y
yum install -y python3
rm -rf /home/ec2-user/app
mkdir -p /home/ec2-user/app
