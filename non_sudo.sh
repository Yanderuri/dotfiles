USER_TO_MODIFY="vy-fae"
# Add some input collection here

cp themes/.zshrc /home/$USER_TO_MODIFY/.zshrc
chsh -s $(command -v zsh)
cp -r themes/nvim /home/$USER_TO_MODIFY/.config/

# If you need to reinstall things such as onedrive and git-credential-oauth
# Copy the binary over to /usr/opt
# Symlink the binary into /usr/bin to be accessible from terminal
# Or just install from the default distro one


git config --global core.editor "nvim"
