package Perl::Critic::Policy::Mardem::ProhibitLargeFile;

use utf8;

use 5.010;

use strict;
use warnings;

our $VERSION = '0.05_001';

use Readonly;

use Perl::Critic::Utils qw{:severities :data_conversion :classification};

use base 'Perl::Critic::Policy';

Readonly::Scalar my $EXPL => q{Consider refactoring};

sub default_severity
{
    return $SEVERITY_LOW;
}

sub default_themes
{
    return qw(maintenance);
}

sub applies_to
{
    return 'PPI::Document';
}

sub supported_parameters
{
    return ();
}

sub violates
{
    # ToDo: new feature to implement
    return;
}

1;

__END__

#-----------------------------------------------------------------------------

=pod

=encoding utf8

=head1 ATTENTION

... todo not yet implemented ...

=head1 NAME

Perl::Critic::Policy::Mardem::ProhibitLargeFile

=head1 DESCRIPTION

This Policy counts the lines within a Perl-File
(more precise the PPI::Document's)

=head1 AFFILIATION

This policy is part of L<Perl::Critic::Mardem>.

=head1 AUTHOR

Markus Demml, mardem@cpan.com

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2024, Markus Demml

This library is free software; you can redistribute it and/or modify it
under the same terms as the Perl 5 programming language system itself.
The full text of this license can be found in the LICENSE file included
with this module.

=cut
