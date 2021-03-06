#!/bin/bash

echo "Installing pre-requisites ... "
sudo apt install build-essential -y
sudo apt install curl -y
echo "Finish installing pre-requisites ... "
echo ""
echo "Installing nodejs ... "
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y
echo "Finish installing nodejs ... "
echo ""
echo "Installing yarn ... "
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
echo "Finish installing yarn ... "
echo ""
echo "Entering frontend directory ... "
cd frontend
yarn install
cd ..
echo "Exiting frontend directory ... "
echo ""
echo "Entering backend directory ... "
cd backend
sudo DEBIAN_FRONTEND=noninteractive apt install mysql-server -y
sudo mysql -e "CREATE DATABASE db;"
sudo mysql db < mySQLcommand.sql
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';"
yarn install
cd ..
echo "Exiting backend directory ... "