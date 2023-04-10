package generate_html;

sub create_points
{
    my $food_truck_data = $_[0];

    my $string = "const points = [\n";

    my $i = 0;
    foreach my $item( @$food_truck_data ) 
    { 
        # to exclude some weird points
        if($item->{latitude} != 0)
        {
            # to show the pop-up
            my $content = create_content($item->{applicant},$item->{address},$item->{fooditems},$item->{dayshours});
            
            #array javascript
            $string .= '["'.$item->{applicant}.'",'.$item->{latitude}.','.$item->{longitude}.','.$i.',"'.$item->{facilitytype}.'","'.$content.'"],'."\n";
            $i +=1;
        }
    }

    $string .= "\n];\n";
    return $string;
}

sub create_content
{
    my ($applicant,$address,$fooditems,$dayshours) = @_;

    my $content = "<div id='content'>";
    $content .= "<h1>".$applicant."</h1>";
    
    $content .= "<div id='bodyContent'>";
    $content .= "<h2><b>Adress</h2>".$address."</b><br>";
    
    # some points dont have the food items attribute
    if ($fooditems)
    {
        $fooditems =~ s/:/,/g;
    }
    else
    {
        $fooditems = "Not Informed";
    }

    $content .= "<h2><b>Type of Food </b></h2>".$fooditems."<br>";
    
    # some points dont have the day hours attribute
    if(!$dayshours)
    {
        $dayshours = "Not Informed";
        
    }

    $content .= "<h2><b>Operating Hours </b></h2>".$dayshours."<br>";
    
    $content .= "</div>";
    $content .= "</div>";
    
    return $content;

}

sub print_html
{
    my $map_points = $_[0];


    open BASIC_HTML, '<', 'Library\\base_map.html' or die $!;
    my $page_base = do { local $/; <BASIC_HTML> };
    close BASIC_HTML;
 
    $page_base =~ s/MAP_POINTS/$map_points/;
    
    open FINAL_HTML, '>', "food_truck_map.html" or die $!;
    print FINAL_HTML $page_base;
    close FINAL_HTML;
    
}
return 1;