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

# comunicate with the database using api
my $foo_truck_data = api_data::get_data();

# organize the data in the form of a javascript array
my $map_points = generate_html::create_points($foo_truck_data);

# print the html with the new points
generate_html::print_html($map_points);
 
