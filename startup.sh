sudo apt update
sudo apt upgrade -y
sudo apt install --no-install-suggests --install-suggests -y $(which packages.txt)
chsh -s $(which zsh)
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Remember to add your flatpak store extension:\nGNOME: apt install gnome-software-plugin-flatpak\nKDE: apt install plasma-discover-backend-flatpak"

sudo flatpak install flathub com.usebottles.bottles