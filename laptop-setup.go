package main

import (
	"runtime"
	"bufio"
	"os"
	"fmt"
	"os/exec"
	"bytes"
	"os/user"
	"strings"
	"log"
	"strconv"
)

func check(e error) {
	if e != nil {
		log.Fatal(e)
	}
}

func main() {
	PS := "/"
	installFromPath := ""
	chromePath := ""
	atomPath := ""
	studentPath := ""
	homePath := ""
	workPath := ""
	codePath := "code"
	myUID := 0
	myGID := 0

	if runtime.GOOS == "linux" || runtime.GOOS == "darwin" {
		// common parts
		myUser, err := user.Lookup(os.Getenv("SUDO_USER"))
		check(err)
		homePath = myUser.HomeDir
		fmt.Println("homepath:", homePath)
		studentPath = homePath + PS + "students"
		os.Mkdir(studentPath, 0755)
		myUID, _ := strconv.Atoi(os.Getenv("SUDO_UID"))
		myGID, _ := strconv.Atoi(os.Getenv("SUDO_GID"))
		os.Chown(studentPath, myUID, myGID)

		if runtime.GOOS == "linux" {
			installFromPath = "linux"

			chromePath, err = exec.LookPath("google-chrome")
			if err != nil {
				// install Chrome
				cmd := exec.Command("/usr/bin/dpkg", "-i", installFromPath+PS+"google-chrome-stable_current_amd64.deb")
				var out bytes.Buffer
				var stderr bytes.Buffer
				cmd.Stdout = &out
				cmd.Stderr = &stderr
				err := cmd.Run()
				if err != nil {
					fmt.Println(fmt.Sprint(err) + ": " + stderr.String())
					check(err)
				}
			} else {
				fmt.Printf("chrome is available at %s\n", chromePath)
			}

			atomPath, err = exec.LookPath("atom")
			if err != nil {
				// install Chrome
				cmd := exec.Command("/usr/bin/dpkg", "-i", installFromPath+PS+"atom-amd64.deb")
				var out bytes.Buffer
				var stderr bytes.Buffer
				cmd.Stdout = &out
				cmd.Stderr = &stderr
				err := cmd.Run()
				if err != nil {
					fmt.Println(fmt.Sprint(err) + ": " + stderr.String())
					check(err)
				}
			} else {
				fmt.Printf("atom is available at %s\n", atomPath)
			}

		} else if runtime.GOOS == "darwin" { // mac
			installFromPath = "mac"

			// is atom installed
			// is chrome installed
		}
	} else if runtime.GOOS == "windows" {
		PS = "\\"
		installFromPath = "windows"

		// is atom installed
		// is chrome installed

	}

	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Enter student name: ")
	text, _ := reader.ReadString('\n')
	fmt.Println(text)
	studentName := strings.Replace(strings.ToLower(text), "\n", "", 100)
	studentName = strings.Replace(studentName, " ", "_", 100)

	workPath = studentPath + PS + studentName
	os.Mkdir(workPath, 0755)
	if runtime.GOOS == "linux" || runtime.GOOS == "darwin" {
		os.Chown(workPath, myUID, myGID)
	}

	fmt.Println(`
Which project would you like to work on today?
"HTML Track:"
"1. Beginner HTML/CSS: My First Website"
"2. Intermediate HTML/CSS"
"3. Advanced HTML/CSS"
"JavaScript track:"
"4. Beginner JavaScript"
"5. Intermediate JavaScript"
"6. Advanced JavaScript"
"7. Valentine's Day JavaScript"
"Other:"
"8. Beginner Databases"
"enter the project number or Enter for none:`)
	text, _ = reader.ReadString('\n')
	projectChoice := strings.Replace(text, "\n", "", 100)

	var cmd * exec.Cmd
	var out bytes.Buffer
	var stderr bytes.Buffer

	instructionPdf := ""
	// HTML Track
	if projectChoice == "1" {
		instructionPdf = "My_first_website.pdf"
		if runtime.GOOS == "linux" || runtime.GOOS == "darwin" {
			copySwitch := ""
			if runtime.GOOS == "linux" {
				copySwitch = "-xa"
			} else if runtime.GOOS == "darwin" {
				copySwitch = "-Ra"
			}
			cmd = exec.Command("cp", copySwitch, "instructions" + PS + instructionPdf, workPath)
			cmd.Stdout = &out
			cmd.Stderr = &stderr
			err := cmd.Run()
			cmd = exec.Command("cp", copySwitch, codePath + PS + "MyFirstWebsite", workPath)
			cmd.Stdout = &out
			cmd.Stderr = &stderr
			err = cmd.Run()
			if err != nil {
				fmt.Println(fmt.Sprint(err) + ": " + stderr.String())
				check(err)
			}
		} else if runtime.GOOS == "windows" {
		}
		fmt.Println(chromePath, workPath+PS+instructionPdf, workPath+PS+"MyFirstWebsite"+PS+"about-me/html")
			cmd = exec.Command(chromePath, workPath+PS+instructionPdf, workPath+PS+"MyFirstWebsite"+PS+"about-me/html")
			cmd.Stdout = &out
			cmd.Stderr = &stderr
			cmd.Start()
		fmt.Println(atomPath, workPath + PS + "MyFirstWebsite", workPath + PS + "MyFirstWebsite" + PS + "about-me/html")
		cmd = exec.Command(atomPath, workPath + PS + "MyFirstWebsite", workPath + PS + "MyFirstWebsite" + PS + "about-me/html")
		cmd.Stdout = &out
		cmd.Stderr = &stderr
		cmd.Start()
	}
}

/*

$projectdir = "$HOME/students/$studentname"
if [ "$project" = "1" ]; then
    cp -xa code/MyFirstWebsite $projectdir
    cp instructions/My_first_website.pdf $projectdir
    firefox $projectdir/My_first_website.pdf file://$projecctdir/MyFirstWebsite/about-me.html &
    atom $projectdir/MyFirstWebsite/ $projectdir/MyFirstWebsite/about-me.html &
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


 */
