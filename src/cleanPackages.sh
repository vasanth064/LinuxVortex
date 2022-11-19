#clean unwanted programs
echo '------------------Clean GNOME Bloats-----------------'
echo '-----------------------------------------------------'
file="./Packages/bloats"
while IFS= read -r line
do
    if [ $1 == 'a' ]
    then
    	printf '%s\n' "Removing $line"
        sudo dnf remove $line -y
        sudo dnf autoremove -y
    elif [ $1 == 's' ]
    then
    	printf '%s\n' "Removing $line"
        sudo apt remove $line -y
        sudo apt autoremove -y   
    elif [ $1 == 'd' ]
    then
        echo 'Arch'
    elif [ $1 == 'f' ]
    then
    	printf '%s\n' "Removing $line"
        sudo apt remove $line -y
        sudo apt autoremove -y
    fi   
done < "$file"
echo '-----------------------------------------------------'

if [ $1 == 'a' ]
then
	echo 'Fedora'
elif [ $1 == 's' ]
then
	echo 'Ubuntu'
elif [ $1 == 'd' ]
then
	echo 'Arch'
elif [ $1 == 'f' ]
then
	echo 'Debian'
fi

