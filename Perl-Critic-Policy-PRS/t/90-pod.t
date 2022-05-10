#!perl

use utf8;

use 5.010;

use strict;
use warnings;

our $VERSION = '0.01';

use Cwd qw( abs_path );
use Path::This qw( $THISDIR );
use Test::More;
use English qw( -no_match_vars );

local $EVAL_ERROR = undef;
my $eval_ok = eval {
    use Test::Pod 1.00;
    return 'ok';
};

if ( $EVAL_ERROR || 'ok' ne $eval_ok ) {
    plan 'skip_all' => 'Test::Pod 1.00 required for testing POD';
}

my @poddirs = ( abs_path( $THISDIR ) . '/../' );

all_pod_files_ok( all_pod_files( @poddirs ) );

done_testing();

__END__

#-----------------------------------------------------------------------------

=pod

=encoding utf8

=head1 NAME

90-pod.t

=head1 DESCRIPTION

Test-Script

=head1 AFFILIATION

This policy is part of L<Mardem::RefactoringPerlCriticPolicies|Mardem::RefactoringPerlCriticPolicies>.

=head1 AUTHOR

mardem, C<< <mardem at cpan.com> >>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2022, mardem

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself. The
full text of this license can be found in the LICENSE file included
with this module.

=cut
