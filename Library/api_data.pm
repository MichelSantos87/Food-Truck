package api_data;

use HTTP::Request; 
use HTTP::Headers; 
use LWP::UserAgent; 
use JSON::PP;

sub get_data
{
    
    my $host = "https://data.sfgov.org/resource/rqzj-sfat.json";
    my $ua = LWP::UserAgent->new;
    
    # set custom HTTP request header fields
    my $req = HTTP::Request->new(GET => $host);
    $req->header('content-type' => 'application/json');
    
    my $resp = $ua->request($req);

    #if the request is sucess    
    if ($resp->is_success) 
    {
        #send the content in the json format    
        my $obj = decode_json($resp->content);
        return $obj;
    }
    else 
    {
        print "HTTP GET error code: ", $resp->code, "n";
        print "HTTP GET error message: ", $resp->message, "n";

        return 0;
    }
}

return 1;