#!/usr/bin/env perl
use strict;
use warnings;
use List::Util qw/any/;
use feature qw/say/;

my @old = `uname -r` =~ /(\d+)/g;
my @new = `pacman -Q linux` =~ /(\d+)/g;

my $reboot = @old != @new || any {$old[$_] != $new[$_]} (0..(@new-1));

if ($reboot) {
       print "YOUR FUCKING KERNEL IS FUCKING OLD!\n";
}
