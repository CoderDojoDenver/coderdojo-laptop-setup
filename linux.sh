#!/bin/bash

echo Enter your user password below to install things:
sudo ls /tmp > /dev/null
echo "Installing some software for you, be right back!"
sudo apt-get install git 2>&1 > /dev/null
ATOM=`dpkg -l | grep "ii  atom  "`
if [ ".$ATOM" = "." ]; then
    sudo dpkg -i ./atom-amd64.deb 2>&1 > /dev/null
fi

clear
ATOM=`ps fax | grep /usr/share/atom/atom | grep -v grep`
if [ ".$ATOM" != "." ];then
    echo "the Atom editor is already running, please exit it first"
    echo "press Enter when done"
    read nothing
fi
FFOX=`ps fax | grep /usr/lib/firefox | grep -v grep`
if [ ".$FFOX" != "." ];then
    killall firefox 2>&1 > /dev/null
fi

clear
echo "All done that part."
echo
echo "Please type your name:"
read studentname
mkdir -p "$HOME/students/$studentname" 2>&1 > /dev/null
cd "$HOME/students/$studentname"
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
    git clone git@github.com:CoderDojoDenver/MyFirstWebsite
    firefox http://kata.coderdojo.com/images/c/c0/My_first_website.pdf file://$HOME/students/$studentname/MyFirstWebsite/about-me.html &
    atom MyFirstWebsite/ MyFirstWebsite/about-me.html &
fi
if [ "$project" = "2" ]; then
    git clone git@github.com:CoderDojoDenver/Intermediate-HTML-CSS
    firefox http://kata.coderdojo.com/images/5/59/Intermediate-HTML-CSS-Sushi.pdf file://$HOME/students/$studentname/Intermediate-HTML-CSS/example.html &
    atom Intermediate-HTML-CSS/ Intermediate-HTML-CSS/example.html &
fi
if [ "$project" = "3" ]; then
    git clone git@github.com:CoderDojoDenver/Advanced-HTML-CSS
    firefox http://kata.coderdojo.com/images/5/5f/Advanced_HTML_CSS_Sushi.pdf file://$HOME/students/$studentname/Advanced-HTML-CSS/advanced_site/template.html &
    atom Advanced-HTML-CSS/advanced_site Advanced-HTML-CSS/advanced_site/template.html &
fi

if [ "$project" = "4" ]; then
    git clone git@github.com:CoderDojoDenver/Beginner-JavaScript
    firefox http://kata.coderdojo.com/images/0/05/Beginner_Javascript_Sushi.pdf file://$HOME/students/$studentname/Beginner-JavaScript/example.html &
    atom Beginner-JavaScript/example.html &
fi
if [ "$project" = "5" ]; then
    git clone git@github.com:CoderDojoDenver/Intermediate-JavaScript
    firefox http://kata.coderdojo.com/images/5/5c/Intermediate_Javascript_Sushi.pdf file://$HOME/students/$studentname/Intermediate-JavaScript/example.html &
    atom Intermediate-JavaScript/example.html &
fi
if [ "$project" = "6" ]; then
    git clone git@github.com:CoderDojoDenver/Advanced-JavaScript
    firefox http://kata.coderdojo.com/images/f/f9/Advanced_Javascript_Sushi.pdf file://$HOME/students/$studentname/Advanced-JavaScript/index.html &
    atom Advanced-JavaScript/index.html &
fi
if [ "$project" = "7" ]; then
    git clone git@github.com:CoderDojoDenver/ecard-sushi
    firefox http://coderdojo-iowacity.github.io/ecard-sushi/ file://$HOME/students/$studentname/ecard-sushi/index.html &
    atom ecard-sushi &
fi

if [ "$project" = "8" ]; then
    echo "Installing more software, be right back!"
    sudo apt-get install -y mysql-server mysql-client
    firefox http://kata.coderdojo.com/images/6/69/Beginner-Databases.pdf &
fi

echo "Okay, have fun!"

