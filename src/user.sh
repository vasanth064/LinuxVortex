#setup gh
gh auth login
gh auth setup-git
gh auth status

#setup git bare
cd
git clone git@github.com:vasanth064/.dotfiles.git

#Config ZSH
sudo usermod -s /usr/bin/zsh $(whoami)
curl -sS https://starship.rs/install.sh | sh
exec zsh
