#!/usr/bin/env perl

use v5.36;
use List::Util qw/tail/;

sub hc {local $" = ' '; $_ = qx(herbstclient @_); chomp; $_}

sub with_hc_idle {
    my $cb = pop;

    my $fh;
    { local $" = " "; open($fh, '-|', qq(herbstclient --idle @_)) or die $!; }

    do { $cb->() } while <$fh>;
}

sub run {
    my $monitor = $ENV{POLYBAR_MONITOR} // 0;
    my %colors = (
	#nor_fg => hc(qw/get_attr theme.title_color/),
	nor_fg => '#ababab',
	nor_bg => hc(qw/get_attr settings.frame_border_normal_color/),
	sel_fg => '#101010',
	sel_bg => hc(qw/get_attr theme.active.color/),
	urg_bg => hc(qw/get_attr theme.urgent.color/),
	unf_fg => '#141414',
	unf_bg => hc(qw/get_attr theme.active.background_color/),
	);

    with_hc_idle qw/tag_/, sub {
	my @tags = tail -1, split /\t/, hc qw/tag_status/, $monitor;

	for my $tag (@tags) {
	    my ($idx, $name) = (substr($tag, 0, 1), substr($tag, 1));

	    for ($idx) {
		# states:
		# : the tag is not empty
		# + the tag is viewed on the specified MONITOR, but this monitor is not focused
		# # the tag is viewed on the specified MONITOR and it is focused
		# ! the tag contains an urgent window
		if (/^:/)  { print "%{F$colors{nor_fg}}"; last}
		if (/^\+/) { print "%{F$colors{unf_fg}}%{B$colors{unf_bg}}"; last}
		if (/^#/)  { print "%{F$colors{sel_fg}}%{B$colors{sel_bg}}"; last}
		if (/^!/)  { print "%{F#141414}%{B$colors{urg_bg}}"; last}
		print "%{F#ababab}%{B-}"
	    }

	    print "%{A1:herbstclient chain , focus_monitor $monitor , use $name:} $name %{A -u -o F- B-}";
	}
	print "\n";
	STDOUT->flush;
    };
}

run;
