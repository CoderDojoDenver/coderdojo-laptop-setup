package main

import (
	//"net/http"
	//"io"
	//"os"
	"fmt"
	"io/ioutil"
	"strings"
	"os"
	"net/http"
	"net/url"
	"io"
	"log"
)

func check(e error) {
	if e != nil {
		log.Fatal(e)
	}
}

func main() {
	// get list of files we need to download
	dat, err := ioutil.ReadFile("download-files.txt")
	check(err)
	files := strings.Split(string(dat), "\n")

	// download each file into its place
	for _, file := range files {
		var downloadURL, destFile, destFolder string
		if len(file) == 0 {
			continue
		}
		fmt.Println("file: ", file)

		bits := strings.Split(string(file), " ")
		if bits[0] == "#" {
			continue
		}
		downloadURL = bits[0]
		destFolder = bits[1]

		urlBits, err := url.Parse(downloadURL)
		check(err)
		destPath := urlBits.Path
		moreBits := strings.Split(destPath, "/")
		destFile = moreBits[len(moreBits)-1]

		if len(downloadURL) > 0 && len(destFolder) > 0 {
			out, err := os.Create(destFolder + "/" + destFile)
			check(err)
			defer out.Close()

			resp, err := http.Get(downloadURL)
			check(err)
			defer resp.Body.Close()
			_, err = io.Copy(out, resp.Body)
			check(err)
		}
	}
}
