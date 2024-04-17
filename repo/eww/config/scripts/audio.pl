#!/usr/bin/env perl

use strict;
use warnings;

sub playerctl {local $" = ' '; $_ = qx(playerctl @_); chomp; $_}

sub player_label {
    my ($player) = @_;
    my %icons = (
	firefox => '',
	spotify => '',
    );

    my $icon = %icons{$player} // '';

    print qq(\(label :class "audio-player-label" :text "${icon} ${player}"\))
}

sub run {
    my @players = split('\n', playerctl('-l'));
    print qq(\(box :class "popup-box" :orientation "v");
    for my $instance (@players) {
        my ($player) = split(/\./,$instance);
	my $metadata = playerctl('-p', $player,'metadata', '-f', '"{{artist}};{{album}};{{title}}"');
	my $image_url = playerctl('-p', $player,'metadata','mpris:artUrl');

	print qq(\(box :orientation "h" :class "audio-player" :space-evenly false);
	print qq(\(box :width 256 :height 128 :class "audio-thumb" :style 'background-image: url("$image_url")'\));
	print qq(\(box :halign "center" :valign "center" :orientation "v" :class "audio-metadata" :space-evenly false :spacing 20);
	player_label($player);
	for my $item (split(';', $metadata)) {
	    if ($item ne '') { print qq(\(label :text "$item" :width 300 :wrap true\)); }
	}

	print qq(\(box :halign "center" :space-evenly false :height 32);
	print qq(\(box :halign "center" :orientation "h" :class "audio-media-buttons" :space-evenly true :spacing 15 :width 200);
	print qq(\(button :class "audio-media-button" :onclick "playerctl -p ${player} previous" (label :justify "center" :text '')\));
	if(playerctl('-p', $player, 'status') eq 'Playing') {
	    print qq(\(button :class "audio-media-button" :width 20 :height 20 :onclick "playerctl -p ${player} pause" (label :justify "center" :text '')\));
	} else {
	    print qq(\(button :class "audio-media-button" :onclick "playerctl -p ${player} play" (label :justify "center" :text '')\));
	}
	print qq(\(button :class "audio-media-button" :onclick "playerctl -p ${player} stop" (label :justify "center" :text '')\));
	print qq(\(button :class "audio-media-button" :onclick "playerctl -p ${player} next" (label :justify "center" :text '')\));

	print qq(\)\)\)\));
    }
    print qq(\));
}

run;
