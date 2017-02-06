#!/bin/bash

echo Enter your user password below to install things:
sudo ls /tmp > /dev/null
echo "Installing some software for you, be right back!"

ATOM=`ls -1 /Applications/Atom.app`
if [ ".$ATOM" = "." ]; then
    echo "installing Atom from usb"
    sudo cp -a mac/Atom.app /Applications/
fi

FFOX=`ls -1 /Applications/Firefox.app`
if [ ".$FFOX" = "." ]; then
    echo "installing firefox from usb"
    FFOX_IMAGE="Firefox 51.0.1.dmg"
    sudo hdiutil attach "mac/$FFOX_IMAGE"
    sudo cp -a /Volumes/Firefox/Firefix.app /Applications/
    sudo hdiutil detach /Volumes/Firefox
fi

clear
ATOM=`ps aux | grep -i /Applications/Atom.app | grep -v grep`
if [ ".$ATOM" != "." ];then
    echo "the Atom editor is already running, please exit it first"
    echo "press Enter when done"
    read nothing
fi
FFOX=`ps aux | grep -i /usr/lib/firefox | grep -v grep`
if [ ".$FFOX" != "." ];then
    killall firefox 2>&1 > /dev/null
fi
FFOX="/Applications/Firefox.app/Contents/MacOS/firefox"


clear
echo "All done that part."
echo
echo "Please type your name:"
read studentname
mkdir -p "$HOME/students/$studentname" 2>&1 > /dev/null
pwd

echo
echo "Which project would you like to work on today?"
echo "HTML Track:"
echo "1. Beginner HTML/CSS: My First Website"
echo "2. Intermediate HTML/CSS"
echo "3. Advanced HTML/CSS"
echo "JavaScript track:"
echo "4. Beginner JavaScript"
echo "5. Intermediate JavaScript"
echo "6. Advanced JavaScript"
echo "7. Valentine's Day JavaScript"
echo "Other:"
echo "8. Beginner Databases"
echo "enter the project number or Enter for none:"
read project

if [ "$project" = "1" ]; then
    cp -a code/MyFirstWebsite $HOME/students/$studentname
    $FFOX http://kata.coderdojo.com/images/c/c0/My_first_website.pdf file://$HOME/students/$studentname/MyFirstWebsite/about-me.html &
    cd $HOME/students/$studentname 
    atom MyFirstWebsite/ MyFirstWebsite/about-me.html &
fi
if [ "$project" = "2" ]; then
    cp -a code/Intermediate-HTML-CSS $HOME/students/$studentname
    $FFOX http://kata.coderdojo.com/images/5/59/Intermediate-HTML-CSS-Sushi.pdf file://$HOME/students/$studentname/Intermediate-HTML-CSS/example.html &
    cd $HOME/students/$studentname 
    atom Intermediate-HTML-CSS/ Intermediate-HTML-CSS/example.html &
fi
if [ "$project" = "3" ]; then
    cp -a code/Advanced-HTML-CSS $HOME/students/$studentname
    $FFOX http://kata.coderdojo.com/images/5/5f/Advanced_HTML_CSS_Sushi.pdf file://$HOME/students/$studentname/Advanced-HTML-CSS/advanced_site/template.html &
    cd $HOME/students/$studentname 
    atom Advanced-HTML-CSS/advanced_site Advanced-HTML-CSS/advanced_site/template.html &
fi

if [ "$project" = "4" ]; then
    cp -a code/Beginner-JavaScript $HOME/students/$studentname
    $FFOX http://kata.coderdojo.com/images/0/05/Beginner_Javascript_Sushi.pdf file://$HOME/students/$studentname/Beginner-JavaScript/example.html &
    cd $HOME/students/$studentname 
    atom Beginner-JavaScript/example.html &
fi
if [ "$project" = "5" ]; then
    cp -a code/Intermediate-JavaScript $HOME/students/$studentname
    $FFOX http://kata.coderdojo.com/images/5/5c/Intermediate_Javascript_Sushi.pdf file://$HOME/students/$studentname/Intermediate-JavaScript/example.html &
    cd $HOME/students/$studentname 
    atom Intermediate-JavaScript/example.html &
fi
if [ "$project" = "6" ]; then
    cp -a code/Advanced-JavaScript $HOME/students/$studentname
    $FFOX http://kata.coderdojo.com/images/f/f9/Advanced_Javascript_Sushi.pdf file://$HOME/students/$studentname/Advanced-JavaScript/index.html &
    cd $HOME/students/$studentname 
    atom Advanced-JavaScript/index.html &
fi
if [ "$project" = "7" ]; then
    cp -a code/ecard-sushi $HOME/students/$studentname
    $FFOX http://coderdojo-iowacity.github.io/ecard-sushi/ file://$HOME/students/$studentname/ecard-sushi/index.html &
    cd $HOME/students/$studentname 
    atom ecard-sushi &
fi

if [ "$project" = "8" ]; then
    $FFOX http://kata.coderdojo.com/images/6/69/Beginner-Databases.pdf &
fi

echo "Okay, have fun!"

