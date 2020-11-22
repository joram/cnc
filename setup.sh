

#NVM
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
cd ..
~/.nvm/install.sh
~/.nvm/nvm.sh
nvm install v10.13.0
nvm use v10.13.0
npm install npm@latest -g

# CNCJS
npm install --save serialport 

sudo npm install --unsafe-perm -g cncjs



