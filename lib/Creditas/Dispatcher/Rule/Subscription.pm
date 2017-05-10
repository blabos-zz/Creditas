package Creditas::Dispatcher::Rule::Subscription;

use Moo;
extends 'Creditas::Dispatcher::Rule';

sub BUILD {
    my ($self) = @_;

    $self->name('subscription');
    return;
}

sub dispatch {
    my ( $self, $order ) = @_;

    $self->activate_subscription($order);
    $self->notify_user($order);

    return;
}

sub activate_subscription {
    my ( $self, $order ) = @_;

    my $id = $order->{id};
    print "==> System:\n";
    print "Subscription for order $id successfully activated\n\n";

    return;
}

sub notify_user {
    my ( $self, $order ) = @_;

    my $user = $order->{owner}{name};

    print "==> User:\n";
    print "Dear $user,\n";
    print "Your service subscription has been successfully activated.\n\n";

    return;
}

1;
