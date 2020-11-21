sudo apt -y remove nodejs

git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
cd ..
~/.nvm/install.sh
~/.nvm/nvm.sh
nvm install 4
nvm use 4
npm install npm@latest -g

sudo npm install --unsafe-perm -g cncjs
