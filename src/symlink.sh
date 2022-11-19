echo '----------------Disk Mount & Symlinks----------------'
echo '-----------------------------------------------------'
sudo sh -c "echo $'
#<filesystem>			    <mountpoint>		<type>		<options>                                           <dump>	<pass>
/dev/sda1 					/hdd 				auto 		nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=hdd 	0 		0
/dev/sda2 					/bridge 			ntfs		nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=Bridge 	0 		0
#<filesystem>			    <mountpoint>		<type>		<options>                                           <dump>	<pass>
' >> /etc/fstab"
sudo mount -a
echo '-----------------------------------------------------'
rm -rv ~/Documents
rm -rv ~/Downloads
rm -rv ~/Games
rm -rv ~/ISO
rm -rv ~/Music
rm -rv ~/Pictures
rm -rv ~/Poco\ M2\ Pro
rm -rv ~/Projects
rm -rv ~/Repos
rm -rv ~/Videos

ln -sv /hdd/Documents ~/Documents
ln -sv /hdd/Downloads ~/Downloads
ln -sv /hdd/Games ~/Games
ln -sv /hdd/ISO ~/ISO
ln -sv /hdd/Music ~/Music
ln -sv /hdd/Pictures ~/Pictures
ln -sv /hdd/Poco\ M2\ Pro ~/Poco\ M2\ Pro
ln -sv /hdd/Projects ~/Projects
ln -sv /hdd/Repos ~/Repos
ln -sv /hdd/Videos ~/Videos

echo '-----------------------------------------------------'