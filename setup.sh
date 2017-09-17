
sudo apt-get install -y git avrdude
mkdir ~/code

// VNC
sudo apt-get update
sudo apt-get install -y realvnc-vnc-server realvnc-vnc-viewer

// bCNC
// https://github.com/vlachoudis/bCNC
cd ~/code
git clone git@github.com:vlachoudis/bCNC.git


// Protoneer
git clone git@github.com:Protoneer/RPI-CNC-Config-Scripts.git
source ~/code/RPI-CNC-Config-Scripts/resources/scripts/Run-Flash-GRBL-Latest.sh