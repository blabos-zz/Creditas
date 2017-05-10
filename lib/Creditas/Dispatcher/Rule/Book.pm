package Creditas::Dispatcher::Rule::Book;

use Moo;
extends 'Creditas::Dispatcher::Rule::PhysicalItem';

sub BUILD {
    my ($self) = @_;

    $self->name('book');
    return;
}

after 'dispatch' => sub {
    my ( $self, $order ) = @_;

    my $id = $order->{id};

    print "==> System:\n";
    print "Please note that order '$id' is a book and should be delivered as ";
    print "'Impresso Normal' by ECT\n\n";
};

1;
