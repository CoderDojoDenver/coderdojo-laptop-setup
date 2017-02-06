Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
$current_drive = (get-location).Drive.Name

echo "Installing some software for you, be right back!"

$FFOX_PATH = "C:\Program Files\Mozilla Firefox"
if(!Test-Path $FFOX_PATH) {
    Start-Process -FilePath "${current_drive}:\windows\Firefox Setup 51.0.1.exe"
}
$ATOM_PATH = "$HOME\AppData\Local\atom"
if(!Test-Path $ATOM_PATH) {
    Start-Process -FilePath "${current_drive}:\windows\AtomSetup.exe"
}
cls
echo "Please type your name (no spaces please):"
$name = Read-Host
$studentname = $name -creplace '[ ]+', '_'
echo "Hi there!"
New-Item -ItemType Directory -Force -Path "C:\CoderDojo\$studentname"

echo ""
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

$menu_option = Read-Host


$project_path = "c:\coderdojo\$studentname"
$firefox = "$FFOX_PATH\firefox.exe"
$atom = "$ATOM_PATH\app-1.13.1\atom.exe"
$atom_arguments = ""

echo "atom: $atom"

if ($menu_option -eq 1) {
    $git_repo = "MyFirstWebsite"
    $pdf_instructions = "http://kata.coderdojo.com/images/c/c0/My_first_website.pdf"
    $editor_start_page = "about-me.html"
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}
if ($menu_option -eq 2) {
    $git_repo = "Intermediate-HTML-CSS"
    $pdf_instructions = "http://kata.coderdojo.com/images/5/59/Intermediate-HTML-CSS-Sushi.pdf"
    $editor_start_page = "example.html"
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}
if ($menu_option -eq 3) {
    $git_repo = "Advanced-HTML-CSS"
    $pdf_instructions = "http://kata.coderdojo.com/images/5/5f/Advanced_HTML_CSS_Sushi.pdf"
    $editor_start_page = "advanced_site/template.html"
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}

if ($menu_option -eq 4) {
    $git_repo = "Beginner-JavaScript"
    $pdf_instructions = "http://kata.coderdojo.com/images/0/05/Beginner_Javascript_Sushi.pdf"
    $editor_start_page = "example.html"
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}
if ($menu_option -eq 5) {
    $git_repo = "Intermediate-JavaScript"
    $pdf_instructions = "http://kata.coderdojo.com/images/5/5c/Intermediate_Javascript_Sushi.pdf"
    $editor_start_page = "example.html"
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}
if ($menu_option -eq 6) {
    $git_repo = "Advanced-JavaScript"
    $pdf_instructions = "http://kata.coderdojo.com/images/f/f9/Advanced_Javascript_Sushi.pdf"
    $editor_start_page = "index.html"
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}
if ($menu_option -eq 7) {
    $git_repo = "ecard-sushi"
    $pdf_instructions = "http://coderdojo-iowacity.github.io/ecard-sushi/"
    $editor_start_page = ""
    $browser_start_page = "file:///c|/coderdojo/$studentname/$git_repo/$editor_start_page"

    windows\git\bin\git clone https://github.com/CoderDojoDenver/$git_repo "c:\coderdojo\$studentname\$git_repo"
    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
    $atom_arguments2 = "$atom_arguments $project_path\$git_repo $project_path\$git_repo\$editor_start_page"
    Start-Process -FilePath $atom $atom_arguments2
}
if ($menu_option -eq 8) {
    $pdf_instructions = "http://kata.coderdojo.com/images/6/69/Beginner-Databases.pdf"
    $browser_start_page = ""

    $firefox_arguments = "$pdf_instructions $browser_start_page"
    Start-Process -FilePath $firefox $firefox_arguments
}
echo "Okay, have fun!"


#echo "press Enter to quit"
#Read-Host