package FortuneCookie::Schema::Result::FcCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 NAME

FortuneCookie::Schema::Result::FcCategory

=cut

__PACKAGE__->table("fc_category");

=head1 ACCESSORS

=head2 fc_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "fc_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "category_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("fc_id", "category_id");

=head1 RELATIONS

=head2 category

Type: belongs_to

Related object: L<FortuneCookie::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "FortuneCookie::Schema::Result::Category",
  { id => "category_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 fc

Type: belongs_to

Related object: L<FortuneCookie::Schema::Result::Fc>

=cut

__PACKAGE__->belongs_to(
  "fc",
  "FortuneCookie::Schema::Result::Fc",
  { id => "fc_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2013-04-30 14:38:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:duy0K7w1yyF/MIpDXdKdQQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
