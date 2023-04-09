package generate_html;

sub create_map
{
    my $food_truck_data = $_[0];

    foreach my $item( @$food_truck_data ) 
    { 
        #print($item);
        my @keys = keys %{$item};
        print(@keys);
        print "\n\n";

        #print "\n".$item->{objectid};
        #print "\n".$item->{applicant};
    
    }
}

sub print_html
{
    my $map = $_[0];

}
return 1;