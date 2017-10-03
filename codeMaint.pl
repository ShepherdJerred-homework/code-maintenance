#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

foreach my $argument (@ARGV) {
    print "$argument\n"
}

my $programName="hello.cpp";
my $executableName = "hello";
system("g++ $programName -o $executableName");
system("./hello > outputFile");
system("diff outputFile expectedOutput");
