#!/usr/bin/perl

use Cwd;

use strict;
use warnings FATAL => 'all';

my $numberOfArguments = @ARGV - 0;

if ($numberOfArguments < 3) {
    print "Missing arguments, expected 3 but got $numberOfArguments\n";
    exit;
}

# Get arguments
my $sourceFile=$ARGV[0];
my $inputFile=$ARGV[1];
my $expectedOutput=$ARGV[2];

# Debug arguments
# print $sourceFile . "\n";
# print $inputFile . "\n";
# print $expectedOutput . "\n";

# Create temp directory
my $tempDirectory = "temp";
mkdir $tempDirectory;

# Copy original files to temp directory
system("cp $sourceFile $tempDirectory");
system("cp $inputFile $tempDirectory");
system("cp $expectedOutput $tempDirectory");

# Move into temp directory
my $originalDirectory = cwd;
chdir $tempDirectory;

print "Compiling...\n";
system("g++ $sourceFile -o compiled");
print "Running...\n";
system("./compiled $inputFile > actualOutput");
print "Diff\n";
my $diffOutput = system("diff actualOutput expectedOutput");

unless ($diffOutput) {
    print "No difference\n";
} else {
    print $diffOutput;
}

# Delete temp files
unlink $sourceFile;
unlink $inputFile;
unlink $expectedOutput;

unlink "actualOutput";
unlink "compiled";
unlink "null";

# Return to original directory
chdir $originalDirectory;
