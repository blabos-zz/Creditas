package Creditas::Dispatcher;

use Moo;
use Carp;

use Creditas::Dispatcher::Rule::Error;

has 'rules' => (
    is      => 'rw',
    default => sub { { error => Creditas::Dispatcher::Rule::Error->new } },
);

sub process_order {
    my ( $self, $order ) = @_;

    my $class = $order->{class};
    my $rule  = $self->rule_for($class);

    $rule->dispatch($order);

    return;
}

sub rule_for {
    my ( $self, $class ) = @_;

    my $rule = $self->rules->{$class} || $self->rules->{error};

    return $rule;
}

sub install_rule {
    my ( $self, $rule ) = @_;

    if ( exists $self->rules->{ $rule->name } ) {
        Carp::croak 'exeption_rule_already_exists';
    }
    else {
        $self->rules->{ $rule->name } = $rule;
    }

    return;
}

sub uninstall_rule {
    my ( $self, $rule_name ) = @_;

    delete $self->rules->{$rule_name};

    return;
}

1;

## ABSTRACT: Creditas Dispatcher
