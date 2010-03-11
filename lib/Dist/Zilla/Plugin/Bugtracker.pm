use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::Bugtracker;

# ABSTRACT: automatically sets the bugtracker URL
use Moose;
with 'Dist::Zilla::Role::MetaProvider';

sub metadata {
    my ($self, $arg) = @_;
    return {
        resources => {
            bugtracker =>
              sprintf('http://rt.cpan.org/Public/Dist/Display.html?Name=%s',
                $self->zilla->name)
        }
    };
}
__PACKAGE__->meta->make_immutable;
no Moose;
1;

=pod

=for test_synopsis
1;
__END__

=head1 SYNOPSIS

In C<dist.ini>:

    [Bugtracker]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files

  xt/release/synopsis.t - a standard Test::Synopsis test

=function metadata

Sets the bugtracker URL in the distribution's metadata.

=cut
__DATA__
___[ xt/release/synopsis.t ]___
#!perl

use Test::More;

eval "use Test::Synopsis";
plan skip_all => "Test::Synopsis required for testing synopses"
  if $@;
all_synopsis_ok('lib');
