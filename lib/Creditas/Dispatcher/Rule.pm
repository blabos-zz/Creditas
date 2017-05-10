package Creditas::Dispatcher::Rule;

use Moo;
use Carp;

has 'name' => (
    is      => 'rw',
    builder => sub { 'base_rule' },
);

sub dispatch {
    Carp::croak 'exception_must_extends_base_class';
}

1;
