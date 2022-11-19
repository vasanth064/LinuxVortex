#Configuring DNF
sudo sh -c "echo $'#Added For Speed\nfastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' >> /etc/dnf/dnf.conf"

#RPM FUSION
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo sudo dnf update -y

#VS code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf update --refresh

#Edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf update --refresh

#Chrome
sudo dnf config-manager --set-enabled google-chrome

#install DNF packages
printf "Installing DNF Packages"
sudo dnf update --refresh
file="./Packages/dnfs"
while IFS= read -r line
do
	printf '%s\n' "Installing $line"
	sudo dnf install $line -y
	printf '%s\n' "Done..., $line"
done <"$file"
printf "Done installing DNF Packages"

sudo dnf update --refresh
sudo dnf auto-remove -y