wget -qO - https://typora.io/linux/public-key.asc | gpg --dearmor >typora-keyring.gpg
cat typora-keyring.gpg | sudo tee /usr/share/keyrings/typora-keyring.gpg >/dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/typora-keyring.gpg] https://typora.io/linux ./' | sudo tee '/etc/apt/sources.list.d/typora.list'
sudo apt update -y
sudo apt install -y typora
rm typora-keyring.gpg

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp ~/.local/share/omakubian/configs/typora/ia_typora.css ~/.config/Typora/themes/
cp ~/.local/share/omakubian/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
