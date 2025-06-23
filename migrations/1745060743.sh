cp ~/.local/share/omakubian/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/omakubian/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/omakubian/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/omakubian/configs/alacritty.toml ~/.config/alacritty/alacritty.toml

source $OMAKUB_PATH/applications/About.sh
source $OMAKUB_PATH/applications/Activity.sh
source $OMAKUB_PATH/applications/Neovim.sh
source $OMAKUB_PATH/applications/Docker.sh
source $OMAKUB_PATH/applications/Omakub.sh

alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true
