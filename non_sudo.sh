USER_TO_MODIFY="vy-faye"
# Add some input collection here

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

ln -fs $(pwd)/themes/.zshrc /home/$USER_TO_MODIFY/.zshrc
ln -fs $(pwd)/apps/.tmux.conf /home/$USER_TO_MODIFY/.tmux.conf 
chsh -s $(command -v zsh)
mkdir /home/$USER_TO_MODIFY/.config/
cp -r themes/nvim /home/$USER_TO_MODIFY/.config/
cp -r themes/alacritty /home/$USER_TO_MODIFY/.config/


# If you need to reinstall things such as onedrive and git-credential-oauth
# Copy the binary over to /usr/opt
# Symlink the binary into /usr/bin to be accessible from terminal
# Or just install from the default distro one

git config --global core.editor "nvim"
git config --global user.name "Yanderuri"
git config --global user.email "hmai35@gatech.edu"
