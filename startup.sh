ROOTUID="0"
if [ "$(id -u)" -ne "$ROOTUID" ] ; then
    echo "This script must be executed with root privileges."
    exit 1
fi
# https://stackoverflow.com/questions/6362428/how-do-i-determine-if-a-shell-script-is-running-with-root-permissions

apt update
apt upgrade -y
apt install --no-install-suggests --install-recommends -y $(cat apps/packages.txt)
cp themes/.zshrc ~/.zshrc
chsh -s $(command -v zsh)

echo "Remember to add your flatpak store extension:\nGNOME: apt install gnome-software-plugin-flatpak\nKDE: apt install plasma-discover-backend-flatpak"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
while IFS= read -r flatpak; do
  # Install the Flatpak
  flatpak install -y flathub "$flatpak"
done < "apps/flatpaks.txt"

exit 0
# https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script

# 2023-11-18: Hardcoded releases might not work forever
# But that is a later Vy problem
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/AnonymousPro.zip -o AnonymousePro.zip
unzip AnonymousePro.zip -d ~/.local/share/fonts
fc-cache -fv

exit 0
