package Creditas::Dispatcher::Rule::Media;

use Moo;
extends 'Creditas::Dispatcher::Rule';

sub BUILD {
    my ($self) = @_;

    $self->name('media');
    return;
}

sub dispatch {
    my ( $self, $order ) = @_;

    $self->mail_user($order);
    $self->add_voucher($order);

    return;
}

sub mail_user {
    my ( $self, $order ) = @_;

    my $id   = $order->{id};
    my $user = $order->{owner}{name};

    print "==> User:\n";
    print "Dear $user,\n";
    print "This is an email with all details about your order '$id'\n\n";

    return;
}

sub add_voucher {
    my ( $self, $order ) = @_;
    my $id   = $order->{id};
    my $user = $order->{owner}{name};

    print "==> System:\n";
    print "Order '$id' granted a voucher of R\$ 10,00 to '$user'\n\n";

    return;
}

1;
