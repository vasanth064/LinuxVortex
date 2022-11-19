echo '--------------------Linux Vortex--------------------'
echo '-----------------Select Distribution----------------'
echo '----------------------------------------------------'
echo 'a) Fedora'
echo 's) Ubuntu'
echo 'd) Arch'
echo 'f) Debian'
echo '-----------------------------------------------------'
read dis
distro
echo '-----------------------------------------------------'

./src/cleanPackages.sh $dis
./src/symlink.sh

echo '------------------Select the package-----------------'
echo 'a) Full Softwares'
echo 's) Minimum Softwares'
echo '-----------------------------------------------------'
read minMax

if [ $minMax == 'a' ]
then
    echo '-------------Full Software Installation--------------'
     ./src/softwares.sh $dis
elif [ $minMax == 's' ]
then
    echo '-------------Mini Software Installation--------------'
    ./src/softwaresMin.sh $dis
fi


