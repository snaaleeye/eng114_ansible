#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install nginx -y
sudo systemctl enable nginx

sudo apt-get install nodejs -y
sudo apt install npm -y
npm install -g npm -y
sudo apt install python-software-properties -y
sudo npm install pm2 -g
npm cache clean -f
npm install -g n
sudo n stable
sudo rm -rf etc/nginx/sites-available/default

sudo echo "export DB_HOST=mongodb://10.47.10.148:27017/posts" >> ~/.bashrc
source ~/.bashrc

cd /home/ubuntu/ && git clone https://github.com/snaaleeye/eng114_dev_ops.git
sudo cp /home/ubuntu/eng114_dev_ops/app/default /etc/nginx/sites-available/
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl enable nginx

cd /home/ubuntu/eng114_dev_ops/app/app && sudo npm i
nohup node app.js > /dev/null 2>&1 &
