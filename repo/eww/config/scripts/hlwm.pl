#!/usr/bin/env perl

use strict;
use warnings;
use Env;

sub hc {local $" = ' '; $_ = qx(herbstclient @_); chomp; $_}

sub build_button {
    my @args = @_;
    my $name = $args[0];
    my $status = $args[1];
    my $index = $args[2];

    my $icon = "";

    if($status eq "selected") {
	$icon = "";
    }

    return qq((button :class "workspace-button color-$status" :onclick "herbstclient use $name" "$icon"))
}

sub get_status {
    my @args = @_;
    my $index = $args[0];

    for($index) {
	if (/^#/) { return "selected"; }
	if (/^!/) { return "urgent"; }
	if (/^\./) { return "empty"; }
	if (/^\:/) { return "nempty"; }
	if (/^-/) { return "vother"; }
	if (/^\+/) { return "vnonfocus"; }
    }
}

sub with_hc_idle {
	my $cb = pop;

	my $fh;
	{ local $" = " "; open($fh, '-|', qq(herbstclient --idle @_)) or die $!; }

	do { $cb->() } while <$fh>;
}

sub run {
    with_hc_idle qw/tag_/, sub {
	chomp(my $hlwm_tag_status_output = qx(herbstclient tag_status));

	my @tags = do {local @_ = split /\t/, $hlwm_tag_status_output; @_[1..$#_]};
	my @buttons = ();

	my $pos = 1;
	for my $tag (@tags) {
	    my ($index, $name) = (substr($tag, 0, 1), substr($tag, 1));
	    my $status = get_status($index);

	    push @buttons, build_button($name, $status, $pos);
	    $pos += 1;
	}
	my $buttons_lines = join " ", @buttons;
	print qq((box :orientation "h" :space-evenly true $buttons_lines)\n);
	STDOUT->flush;
    }
}

run;
