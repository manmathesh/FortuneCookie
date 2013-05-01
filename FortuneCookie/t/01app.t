#!/usr/bin/env perl
use strict;
use warnings;

BEGIN {

    unshift @INC, qq{/home/catalyst/FortuneCookie/lib/};
}

use Test::More;

use Catalyst::Test 'FortuneCookie';

ok( request('/')->is_success, 'Request should succeed' );

done_testing();
