#!/usr/bin/env perl

use strict;
use warnings;

sub notify_send {local $" = ' '; $_ = qx(notify-send @_); chomp; $_}

sub get_status {
    my $battery_path = shift;

    open my $fh, '<', qq($battery_path/status) or die "Can't open file $!";
    chomp(my $file_content = do { local $/; <$fh> });

    if ($file_content eq "Charging") {
	print "󰂄\n";
	exit 0;
    }
}

sub get_capacity {
    my $battery_path = shift;

    open my $fh, '<', qq($battery_path/capacity) or die "Can't open file $!";
    my $file_content = do { local $/; <$fh> };

    my $cap = int($file_content);
    my $icon = "x";

    if ($cap > 90) { $icon = "󰁹"; }
    elsif ($cap > 80) { $icon = "󰂂"; }
    elsif ($cap > 70) { $icon = "󰂁"; }
    elsif ($cap > 60) { $icon = "󰂀"; }
    elsif ($cap > 50) { $icon = "󰁿"; }
    elsif ($cap > 40) { $icon = "󰁾"; }
    elsif ($cap > 30) { $icon = "󰁽"; }
    elsif ($cap > 20) { $icon = "󰁼"; }
    elsif ($cap > 10) {
	notify_send("-u", "critical", qq("Battery low ($cap%)"), qq("Connect charger"));
        $icon = "󰁻";
    }
    elsif ($cap > 0) {
	notify_send("-u", "critical", qq("Battery empty ($cap%)"), qq("Connect charger or turn off"));
        $icon = "󰁺";
    }

    print "$icon\n";
    exit 0;
}

sub run {
    my $battery_path = qq(/sys/class/power_supply/BAT1);

    get_status $battery_path;
    get_capacity $battery_path;
}

run;
