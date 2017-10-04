# code-maintenance
The Code Maintenance division of the MacroHard Corporation is constantly finding and fixing bugs in the corporation’s collection of software products.  Generally the procedure calls for not only editing the source code followed by a re-compile, but a test to see if the new version generates the correct output.
 
You have been asked to automate the recursive testing of a program’s output to see if it generates the correct output.  In particular, you should write a script (you may name you script whatever you deem appropriate) that accepts 3 filenames as arguments.  The first filename corresponds to the program source code written in C++.  The second filename corresponds to an input file that is to be used by the C++ program.  The third filename corresponds to a text file that contains the expected, correct output for the program in question.  A directory path may be provided with any of the filenames.
 
If the program doesn’t require an input file, the second parameter on the command line should be the filename "/dev/null".
 
All of the files - the program source, the input file, and expected output file - should be copied to a scratch test directory before any of them are used by the script so that there is little chance that the originals will be modified by the test procedure.  If the scratch directory doesn’t exist, your script should create one as a subdirectory of the current working directory.
 
Your script should then compile and link the scratch copy of the source code using the GNU g++ compiler.  The script should then run the program – saving the output to a temporary file stored in the scratch test directory.
 
After running the program, your script should then use the UNIX command diff to compare the actual output generated in the previous step with the expected output file and report either that the output conforms to specifications or report any differences as reported by the diff program.
 
After completion, your script should remove all of the temporary copies and scratch files.  Do not remove the original C++ program, the original input file, the original expected output file, or the scratch directory itself.  BE CAREFUL!  This last step is potentially dangerous.
 
Example Runs:
$ codeMaint   hello.cpp   /dev/null  ./test/archive/hello.out
Compiling . . .
Running . . .
Results:
   Output conforms to specifications.
 
 
 
$ codeMaint  /home/imgreedie/salary.cpp   salary.in   ./test/archive/salary.out
Compiling . . .
Running . . .
Results:
5c5
< Ima Greedie        85,000
---
> Ima Greedie       185,000
11c11
< Total          $3,295,000
---
> Total          $3,395,000
