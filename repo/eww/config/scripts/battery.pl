#!/usr/bin/env perl

use strict;
use warnings;

sub notify_send {local $" = ' '; $_ = qx(notify-send @_); chomp; $_}
sub hibernate {local $" = ' '; $_ = qx(systemctl hibernate); chomp; $_}

sub is_charging {
    my $battery_path = shift;

    open my $fh, '<', qq($battery_path/status) or die "Can't open file $!";
    chomp(my $file_content = do { local $/; <$fh> });

    return $file_content eq "Charging";
}

sub get_capacity {
    my $battery_path = shift;

    open my $fh, '<', qq($battery_path/capacity) or die "Can't open file $!";
    my $file_content = do { local $/; <$fh> };

    my $cap = int($file_content);
    my $icon = "x";

    
    if (is_charging $battery_path) { $icon = "󰂄"; }
    elsif ($cap > 90) { $icon = "󰁹"; }
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

	if (!is_charging $battery_path) {
	    hibernate;
	}
    }

    print "$icon\n";
    exit 0;
}

sub run {
    my $battery = $ARGV[0];
    my $battery_path = qq(/sys/class/power_supply/$battery);

    get_capacity $battery_path;
}

run;
