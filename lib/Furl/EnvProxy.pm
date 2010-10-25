package Furl::EnvProxy;

use strict;
use warnings;
use Furl;
our $VERSION = '0.01';

my $orig = \&Furl::new;
sub new_with_env_proxy {
    my ($class, %args) = @_;
    $args{proxy} = $ENV{'HTTP_PROXY'} || '';
    return $orig->($class, %args);
};

{
    no strict 'refs';
    no warnings 'redefine';
    *Furl::new = \&new_with_env_proxy;
}

1;
__END__

=head1 NAME

Furl::EnvProxy -

=head1 SYNOPSIS

  use Furl::EnvProxy;

=head1 DESCRIPTION

Furl::EnvProxy is utility module who are using Furl in wirewall.
You can call Furl::env_proxy without changing the code.

# perl -MFurl::EnvProxy ...

=head1 AUTHOR

mattn E<lt>mattn.jp@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
