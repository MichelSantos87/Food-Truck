#!/usr/bin/perl

use warnings;
use strict;
use HTTP::Request; 
use HTTP::Headers; 
use LWP::UserAgent; 
use JSON::PP;
use Data::Dumper;

my $ua = LWP::UserAgent->new(ssl_opts => { SSL_verify_mode => 'SSL_VERIFY_NONE' });
my $host = "https://data.sfgov.org/resource/rqzj-sfat.json";
my $dataset = get_data($host);

sub get_data{
    
    my $host = $_[0];
    my $ua = LWP::UserAgent->new;
    
    # set custom HTTP request header fields
    my $req = HTTP::Request->new(GET => $host);
    $req->header('content-type' => 'application/json');
    
    my $resp = $ua->request($req);
    my $obj = decode_json($resp->content);
    
    foreach my $item( @$obj ) { 
        #print($item);
        my @keys = keys %{$item};
        print(@keys);
        print "\n\n";

        #print "\n".$item->{objectid};
        #print "\n".$item->{applicant};
    
    }
 
    #print Data::Dumper->Dump([$obj], [qw(obj)]);

    #foreach my $key (keys(@{$obj})) {
    #    print($key);
    #}

    #foreach my $key (keys(%{$var})) {
    #print "Key: $key, Val: $var->{$key}\n";

    #foreach my $linha (@obj)
    #{
    #    print "\n".$linha;
    #    foreach my $key (%{$linha})
    #    {
    #        print "\nKEY->".$key;
    #    }
    #}

    #print(ref($obj));

    #foreach my $key (keys %{$obj}) {
    #    print $key." => ".$obj->{$key}."\n";
    #}
    
    if ($resp->is_success) {
        
        my $message = $resp->decoded_content;
        #$message = decode_json($resp);
        return $message;
    }
    else {
        print "HTTP GET error code: ", $resp->code, "n";
        print "HTTP GET error message: ", $resp->message, "n";
    }
}

