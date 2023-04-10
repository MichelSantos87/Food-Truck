#!/usr/bin/perl

####################
# Library
####################

use lib "Library";
use warnings;
use strict;
use api_data;
use generate_html;

####################
# Main
####################

my $foo_truck_data = api_data::get_data();
my $map_points = generate_html::create_points($foo_truck_data);
generate_html::print_html($map_points);
 
