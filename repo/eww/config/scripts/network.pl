#!/usr/bin/env perl

use strict;
use warnings;
use JSON::PP;

my @blacklist = ('lo');

sub network_data {local $" = ' '; $_ = qx(ip -br -j address); chomp; decode_json $_}

sub run {
   my $info = network_data;

   print qq(\(box :class "network-box" :orientation "v");
   for my $dev (@$info) {
       my $interface = $dev->{'ifname'};

       if (grep( /^$interface$/, @blacklist )) {
	   next;
       }

       my @addresses = @{$dev->{'addr_info'}};
       
       if (!@addresses) {
	   next;
       }

       print qq((label :class "network-label" :text "$interface"));


       for my $addr (@addresses) {
	   my $ip = $addr->{'local'};
	   print qq((button :class "network-button" :onclick "scripts/clipboard.sh $ip" "$ip"));
       }
   }
   print qq(\));
}

run;
