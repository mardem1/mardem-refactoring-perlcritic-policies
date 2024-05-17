#!perl

use utf8;

use 5.010;

use strict;
use warnings;

our $VERSION = '0.05_001';

use Readonly;

use Perl::Critic;

use Test::More;

Readonly::Scalar my $POLICY_NAME => 'Perl::Critic::Policy::Mardem::ProhibitLargeFile';

plan 'tests' => 2;

#####

sub _get_perl_critic_object
{
    my @configs = @_;

    my $pc = Perl::Critic->new(
        '-profile'  => 'NONE',
        '-only'     => 1,
        '-severity' => 1,
        '-force'    => 0
    );

    $pc->add_policy( '-policy' => $POLICY_NAME, @configs );

    return $pc;
}

#####

sub _check_perl_critic
{
    my ( $code_ref ) = @_;

    my @params;

    my $pc = _get_perl_critic_object( @params );

    return $pc->critique( $code_ref );
}

#####

sub _get_description_from_violations
{
    my @violations = @_;

    if ( @violations ) {
        my $violation = shift @violations;
        my $desc      = $violation->description();

        if ( $desc ) {
            return $desc;
        }
    }

    return q{};
}

#####

{
    my $code = '';

    my @violations = _check_perl_critic( \$code );

    ok !@violations, 'no violation with empty code';
}

#####

{
    my $code = <<'END_OF_STRING';
# some one line comment
END_OF_STRING

    my @violations = _check_perl_critic( \$code );

    ok !@violations, 'no violation with one line comment';
}

#####

done_testing();

__END__

#-----------------------------------------------------------------------------

=pod

=encoding utf8

=head1 NAME

90-large-file

=head1 DESCRIPTION

Test-Script

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
