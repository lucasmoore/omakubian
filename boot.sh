set -e

ascii_art='           
                       _          _     _                        
                      | |        | |   (_)            
  ___  _ __ ___   __ _| | ___   _| |__  _  __ _ _ __  
 / _ \|  _ ` _ \ / _` | |/ / | | |  _ \| |/ _` |  _ \ 
| (_) | | | | | | (_| |   <| |_| | |_) | | (_| | | | |
 \___/|_| |_| |_|\__,_|_|\_\\____|____/|_|\__,_|_| |_|
 '
echo -e "$ascii_art"
echo "=> Omakub is for fresh Debian 13+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakubian
git clone https://github.com/lucasmoore/omakubian.git ~/.local/share/omakubian >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakubian
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakubian/install.sh
