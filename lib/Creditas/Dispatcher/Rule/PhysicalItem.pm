package Creditas::Dispatcher::Rule::PhysicalItem;

use Moo;
extends 'Creditas::Dispatcher::Rule';

sub BUILD {
    my ($self) = @_;

    $self->name('physical_item');

    return;
}

sub dispatch {
    my ( $self, $order ) = @_;

    my $id = $order->{id};
    print "==> System:\n";
    print "This is a shipping label for order '$id'\n\n";

    return;
}

1;
