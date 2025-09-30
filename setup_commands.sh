#!/bin/bash
sudo apt update
sudo apt install -y nginx git python3-venv
python3 -m venv venv
source venv/bin/activate
pip install flask
sudo systemctl start nginx
sudo systemctl status nginx
