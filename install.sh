# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omakub installation failed! You can retry by running: source ~/.local/share/omakubian/install.sh"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakubian/install/check-version.sh

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/omakubian/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omakubian/install/first-run-choices.sh
source ~/.local/share/omakubian/install/identification.sh

echo "Installing terminal and desktop tools..."
source ~/.local/share/omakubian/install/desktop.sh
source ~/.local/share/omakubian/install/terminal.sh
