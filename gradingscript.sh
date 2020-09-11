#To automatically compile and execute C++ files for grading
#!/bin/bash
#Grading script for C++ files
# Author: Arun Ravindran
# Date: Sept 11, 2020.

# Instructions - 
# Usage:  ./gradingscript.sh <directory where cpp code is> <test file.cpp>
# <test file.cpp> contains the test function (typically main())
# If no <test file> exists (that is test is part of code), leave the second argument blank
# Open the generated file named "output" in an editor. The compiled results of each file submitted is shown including compilation errors
# Note for Canvas submissions: The name of the student is inserted into the filename by Canvas.
# If you need to rerun the script, delete the file named "output". Else it will append the new run to the old results.


filetype="*.cpp"
ctr=1
for file in $1/*
do
	if [[ $file == $filetype ]];  then
		echo $file >> output
		g++ -std=c++11 $2 $file -o out$ctr &>>output
		if test -f out$ctr; then
			timeout 5s ./out$ctr >> output
			echo $'\n' >> output
   			rm out$ctr
		fi
   		ctr=$(($ctr+1))
 	fi
done

