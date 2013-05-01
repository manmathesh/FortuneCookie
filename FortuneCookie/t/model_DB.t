use strict;
use warnings;
use Test::More;

use FindBin;

BEGIN {
    unshift @INC, qq{$FindBin::Bin/../lib};
}


BEGIN { use_ok 'FortuneCookie::Model::DB' }

done_testing();
