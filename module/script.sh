#!/bin/bash

# Install Nginx and its dependencies
sudo yum update 
sudo yum install nginx 

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

