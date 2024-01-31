#!/bin/bash
sudo apt update -y 
sudo apt install apache2 -y
echo '<h1>This is deployed by Kossi </h1>' | sudo tee /var/www/html/index.html 