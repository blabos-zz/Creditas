package Creditas::Dispatcher::Rule::Error;

use Moo;
extends 'Creditas::Dispatcher::Rule';

sub BUILD {
    my ($self) = @_;

    $self->name('error');
    return;
}

sub dispatch {
    my ( $self, $order ) = @_;

    my $class = $order->{class};
    my $id    = $order->{id};
    print "==> System:\n";
    print "Invalid rule '$class' for order '$id'\n";

    return;
}

1;
