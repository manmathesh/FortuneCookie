package FortuneCookie::View::HTML;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
    INCLUDE_PATH => [ FortuneCookie->path_to('root', 'src') ],
    TIMER   => 0,
    WRAPPER => 'cwrapper.tt2',
);

=head1 NAME

FortuneCookie::View::HTML - TT View for FortuneCookie

=head1 DESCRIPTION

TT View for FortuneCookie.

=head1 SEE ALSO

L<FortuneCookie>

=head1 AUTHOR

catalyst,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
