set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> Omakub is for fresh Debian 13+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakubian
git clone https://github.com/lucasmoore/omakubian.git ~/.local/share/omakubianian >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakubianian
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakubianian/install.sh
