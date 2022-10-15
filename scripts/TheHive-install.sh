#!/bin/bash
#sudo yum update -y
cd /home/ec2-user/
docker-compose up -d
docker ps -a > docker.log