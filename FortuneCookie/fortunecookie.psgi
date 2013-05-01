use strict;
use warnings;

use FortuneCookie;

my $app = FortuneCookie->apply_default_middlewares(FortuneCookie->psgi_app);
$app;

