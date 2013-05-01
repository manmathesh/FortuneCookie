package FortuneCookie::Controller::Fcs;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::HTML::FormFu'; }

=head1 NAME

FortuneCookie::Controller::Fcs - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched FortuneCookie::Controller::Fcs in Fcs.');
}

sub list :Local {

    my ($self, $c) = @_;

    $c->stash(fcs => [$c->model('DB::Fc')->all]);

    $c->stash(template => 'fcs/list.tt2');

}



sub base :Chained('/') :PathPart('fcs') :CaptureArgs(0) {

    my ($self, $c) = @_;

    $c->stash(resultset => $c->model('DB::Fc'));

}


sub object :Chained('base') :PathPart('id') :CaptureArgs(1) {

    my ($self, $c, $id) = @_;

    $c->stash(object => $c->stash->{resultset}->find($id));

    die "Fc $id not found!" if !$c->stash->{object};

}


sub delete :Chained('object') :PathPart('delete') :Args(0) {

    my ($self, $c) = @_;

    $c->stash->{object}->delete;

    $c->response->redirect($c->uri_for($self->action_for('list'),

    {status_msg => "Fortune cookie deleted."}));

}


sub fcookie_create :Chained('base') 

      :PathPart('fcookie_create') :Args(0) :FormConfig {

    my ($self, $c) = @_;



    my $form = $c->stash->{form};

    if ($form->submitted_and_valid) {

        my $fc = $c->model('DB::Fc')->new_result({});

        $form->model->update($fc);

        $c->response->redirect($c->uri_for($self->action_for('list'), 

       {status_msg => "Fortune cookie created."}));

        $c->detach;

    } else {

        my @category_objs = $c->model("DB::Category")->all();

        my @categories;

        foreach (sort {$a->title cmp $b->title} @category_objs) {

            push(@categories, [$_->id, $_->title]);

        }

        my $select = $form->get_element({type => 'Select'});

        $select->options(\@categories);

    }

    $c->stash(template => 'fcs/fcookie_create.tt2');

}


sub fcookie_edit :Chained('object') :PathPart('fcookie_edit') :Args(0)

        :FormConfig('fcs/fcookie_create.yml') {

    my ($self, $c) = @_;



    my $fc = $c->stash->{object};

    unless ($fc) {

        $c->response->redirect($c->uri_for($self->action_for('list'), 

       {error_msg => "Invalid fortune cookie -- cannot edit."}));

        $c->detach;

    }



    my $form = $c->stash->{form};

    if ($form->submitted_and_valid) {

        $form->model->update($fc);

        $c->response->redirect($c->uri_for($self->action_for('list'), 

        { status_msg => "Fortune cookie updated"}));

        $c->detach;

    } else {

        my @category_objs = $c->model("DB::Category")->all();

        my @categories;

        foreach (sort {$a->title cmp $b->title} @category_objs) {

            push(@categories, [$_->id, $_->title]);

        }

        my $select = $form->get_element({type => 'Select'});

        $select->options(\@categories);

        $form->model->default_values($fc);

    }

    $c->stash(template => 'fcs/fcookie_create.tt2');

}



__PACKAGE__->meta->make_immutable;

1;
