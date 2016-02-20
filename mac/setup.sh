#!/bin/bash

echo 'Enter your laptop password at the following prompt '
sudo ls > /dev/null

echo '======================================================================='
echo '======================================================================='
echo
echo 'Downloading and installing the Google Chrome browser'
echo
echo '======================================================================='
echo '======================================================================='
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > googlechrome.dmg
hdiutil mount googlechrome.dmg
sudo cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil unmount "/Volumes/Google Chrome"


echo '======================================================================='
echo '======================================================================='
echo
echo 'Downloading and installing the Atom.io Editor'
echo
echo '======================================================================='
echo '======================================================================='
curl 'https://atom-installer.github.com/v1.5.3/atom-mac.zip?s=1455310830' --compressed > atom.zip
unzip -o -q atom.zip
mv Atom.app /Applications

