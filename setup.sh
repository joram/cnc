

#NVM
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
cd ..
~/.nvm/install.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

chmod 755 ~/.nvm/nvm.sh
~/.nvm/nvm.sh
nvm install v10.13.0
nvm use v10.13.0
npm install npm@latest -g

# CNCJS
npm install --save serialport 

sudo npm install --unsafe-perm -g cncjs



