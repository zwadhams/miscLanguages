//Zach Wadhams CSCI 305 GO Program

package main;

import (
	"fmt";
	"io/ioutil";
	"os";
	"regexp";
	"unicode";
	"strings";
	"strconv";)

// error checking function
func check(e error) {
    if e != nil {
	panic(e);
    }
}

// parses out a number and uses isNum to determine if number
func parseOut(in string) string {
	
	reg, err := regexp.Compile("[a-zA-Z]")
	if err != nil {
		fmt.Printf("Uh oh..")
	}

	processedString := reg.ReplaceAllString(in, " ")

	space := regexp.MustCompile(`\s+`)
	s := space.ReplaceAllString(processedString, " ")

	length := len(s);
	var myString string;
	for i := 0; i < length; i++ {
		//var j = 25	
		r := rune(s[i])
		if unicode.IsSpace(r) {
			myString += s[i:i+1]
		}else {
			var store = s[i:i+1] + s[i+1:i+2]
                       	myCharacter := string(store)
			myString += myCharacter
                        i++
		}
	}

	return myString
}

func split(input string) string{

	out := strings.Split(input, " ");
	temp := "";
	for word := range out {
		number, err := strconv.Atoi(out[word]);
		if err == nil {
			a := string(number);
			temp += string(a)
		}
	}
	return temp;

}
//writes to output.txt
func writeFile(file string, text string) {
	err := ioutil.WriteFile(file, []byte(text), 0644);
	check(err)
	return
}

// reads from the file specified in command line parameter
func readFile(file string) string {
	contents, err := ioutil.ReadFile(file);
	check(err);
	return string(contents);
}

//main function that calls other functions
func main() {
    var input string = os.Args[1];
    var contents string = readFile(input);
    var parsed string = parseOut(contents);
    var end string = split(parsed);
    writeFile("output.txt", end);
    fmt.Println("Task Completed and printed to output file!");
    //output should be: Bonus answer on final is "GO!"
}
