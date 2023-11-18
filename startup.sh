ROOTUID="0"
if [ "$(id -u)" -ne "$ROOTUID" ] ; then
    echo "This script must be executed with root privileges."
    exit 1
fi
# https://stackoverflow.com/questions/6362428/how-do-i-determine-if-a-shell-script-is-running-with-root-permissions

apt update
apt upgrade -y
apt install --no-install-suggests --install-recommends -y $(cat packages.txt)
chsh -s $(which zsh)
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Remember to add your flatpak store extension:\nGNOME: apt install gnome-software-plugin-flatpak\nKDE: apt install plasma-discover-backend-flatpak"

flatpak install -y flathub com.usebottles.bottles
flatpak install -y flathub com.github.IsmaelMartinez.teams_for_linux

exit 0