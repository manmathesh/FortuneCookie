#!/usr/bin/env perl
 
use strict;
use warnings;
use Test::More qw(no_plan);
use FindBin;

BEGIN {
    unshift @INC, qq{$FindBin::Bin/../lib};
}
 
BEGIN { use_ok("Test::WWW::Mechanize::Catalyst" => "FortuneCookie") }

my $fc = Test::WWW::Mechanize::Catalyst->new;

$_->get_ok("http://localhost:3000/fcs/list", "Check Home URL") for $fc;

$_->title_is("Fortune Cookie Collection", "Check Title") for $fc;

$_->content_contains("Fortune Cookie Collection", "Check Header Text" ) for $fc;

$_->get_ok("http://localhost:3000/fcs/fcookie_create", "Check Fortune Cookie Add Page") for $fc;

$_->title_is("Create/Edit Fortune Cookie", "Check Fortune Cookie Add/Edit Page Title") for $fc;

$_->content_contains("Create/Edit Fortune Cookie", "Check Header Text - Add Page" ) for $fc;

$_->get_ok("http://localhost:3000/fcs/id/1/fcookie_edit", "Check Fortune Cookie Edit Link") for $fc;

$_->title_is("Create/Edit Fortune Cookie", "Check Fortune Cookie Add/Edit Page Title") for $fc;

$_->content_contains("Create/Edit Fortune Cookie", "Check Header Text - Add Page" ) for $fc;

done_testing;
