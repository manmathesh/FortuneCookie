use strict;
use warnings;
use Test::More;
iuse FindBin;

BEGIN {
    unshift @INC, qq{$FindBin::Bin/../lib};
}


use Catalyst::Test 'FortuneCookie';
use FortuneCookie::Controller::Fcs;

ok( request('/fcs')->is_success, 'Request should succeed' );
done_testing();
