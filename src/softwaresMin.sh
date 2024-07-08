#dnf Packages
dnf check-update
sudo dnf install git curl wget snapd flatpak -y
sudo dnf install gpg dnf-plugins-core fedora-workstation-repositories -y

#flatpak Config
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#snap Packages
sudo snap install core
sudo snap install gh

#Requirements for user.sh
#Icons
sudo dnf install numix-icon-theme-circle -y
echo 'y/n) Do you want VsCode'
read script
if [ $vs = 'y' ]
then
#vs code
printf "[vscode]\nname=packages.microsoft.com\nbaseurl=https://packages.microsoft.com/yumrepos/vscode/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://packages.microsoft.com/keys microsoft.asc\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscode.repo
sudo dnf update --refresh
sudo dnf install code
fi

echo 'y/n) Do you want Microsoft Edge'
read script
if [ $edge = 'y' ]
then
#edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf update --refresh
sudo dnf install microsoft-edge-stable -y
fi

sudo dnf update --refresh
sudo dnf install zsh chrome-gnome-shell gnome-tweaks -y

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

sudo dnf update --refresh
sudo dnf auto-remove -y

#config Git
git config --global user.email "vasanthvdev@gmail.com"
git config --global user.name "vasanth064"

./user.sh
echo '----------------Installation Complete----------------'
read

sudo reboot
