#Add User to SUDOERS
cp -vr ./Configs/sudoers /etc/

#Add Debian Testing Repo
cp -vr ./Configs/sources.list /etc/apt/

#Installing pre-requtites for External Sources
sudo apt update -y
sudo apt install git curl wget gpg -y

#Adding apt External Sources 
#vs code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

#chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'

printf "Installing APT Packages"
sudo apt update -y
file="./Packages/apts"
while IFS= read -r line
do
	printf '%s\n' "Installing $line"
	sudo apt install $line -y
	printf '%s\n' "Done..., $line"
done <"$file"
printf "Done installing APT Packages"

#Removing Duplicates form apt Sources
rm -f packages.microsoft.gpg
sudo rm microsoft.gpg
sudo rm -rv /etc/apt/sources.list.d/microsoft-edge-dev.list

sudo apt update -y
sudo apt upgrade -y
sudo apt auto-remove -y
