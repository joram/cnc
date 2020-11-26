curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt remove nodejs
sudo apt install nodejs
npm install npm@latest -g

# CNCJS
sudo npm install --unsafe-perm -g cncjs

# On Boot turn on cncjs
sudo npm install pm2 -g
sudo pm2 startup
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u pi --hp /home/pi
pm2 start $(which cncjs) -- --port 8000 -m /tinyweb:/home/pi/tinyweb
pm2 save
pm2 list


