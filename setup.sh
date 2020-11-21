sudo apt -y remove nodejs

git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
cd ..
. ~/.nvm/nvm.sh


add_line_to_bashrc(){
  line=$1
  echo "adding line to ~/.bashrc $line"
  FILE=~/.bashrc
  grep -qxF "$line" $FILE || echo $line >> $FILE
}


add_line_to_basrc 'export NVM_DIR="$HOME/.nvm"'
add_line_to_basrc '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm'

nvm install 4
nvm use 4
npm install npm@latest -g
sudo npm install --unsafe-perm -g cncjs
