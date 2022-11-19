echo '--------------------Post Install---------------------'
echo 'y/n) Setup Scripts at startup'
echo '-----------------------------------------------------'
read script
if [ $script = 'y' ]
then
    echo '---------------Startup Scripts Setup-----------------'
    echo '1) Open a new terminal'
    echo '2) Type $ crontab -e'
    echo '3) Copy the below lines and add it in nano'
    echo ''
    echo '@reboot /home/vasanth/Scripts/organizeDownloads.sh'
    echo '@reboot /home/vasanth/Scripts/organizeDocuments.sh'
    echo ''
    echo '4) Save and press ENTER to continue'
    read enter
fi
