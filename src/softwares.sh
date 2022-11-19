if [ $1 == 'a' ]
then
	./src/Distros/fedora.sh
elif [ $1 == 's' ]
then
	./src/Distros/ubuntu.sh
elif [ $1 == 'd' ]
then
	echo 'Arch'
elif [ $1 == 'f' ]
then
	./src/Distros/debian.sh
fi

#snap Packages
printf "Installing SNAP Packages"
file="./Packages/snaps"
while IFS= read -r line
do
	printf '%s\n' "Installing $line"
	sudo snap install $line
	printf '%s\n' "Done..., $line"
done <"$file"
printf "Done installing SNAP Packages"

#flatpak Packages
printf "Installing FLATPAK Packages"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
file="./Packages/flatpaks"
while IFS= read -r line
do
	printf '%s\n' "Installing $line"
	flatpak install flathub $line -y
	printf '%s\n' "Done..., $line"
done <"$file"
printf "Done installing FLATPAK Packages"

#Install and configure Virtual Manager
sudo groupadd --system libvirt
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo sh -c "echo $'
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
' >> /etc/libvirt/libvirtd.conf"
sudo setfacl -m u:qemu:rx /home/$(whoami)/
sudo getfacl -e /home/$(whoami)/
sudo setfacl -m u:qemu:rx /hdd
sudo getfacl -e /hdd
sudo setfacl -m u:qemu:rx /bridge
sudo getfacl -e /bridge
sudo systemctl restart libvirtd.service
sudo virsh net-start default
sudo virsh net-autostart default
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo systemctl status libvirtd

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

#config Git
git config --global user.email "vasanthvdev@gmail.com"
git config --global user.name "vasanth064"

#config GRUB
cp -vr ./Configs/dracula /usr/share/grub/themes/
cp -vr ./Configs/grub /etc/default/
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

./user.sh
echo '----------------Installation Complete----------------'
read
./postInstall.sh

sudo reboot
