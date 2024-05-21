#!perl

use utf8;

use 5.010;

use strict;
use warnings;

use English qw( -no_match_vars );

use Module::Starter;

sub main
{
    local $EVAL_ERROR = undef;

    my $eval_ok_test = eval {
        Module::Starter->create_distro(
            'force'        => 1,
            'verbose'      => 1,
            'builder'      => 'Module::Build',
            'ignores_type' => [ 'git', 'generic' ],
            'license'      => 'perl',
            'genlicense'   => 1,
            'minperl'      => '5.010',
            'author'       => 'mardem',
            'email'        => 'mardem1@users.noreply.github.com',
            'distro'       => 'Perl-Critic-Mardem',
            'dir'          => 'Perl-Critic-Mardem',
            'modules'      => [
                'Perl::Critic::Mardem',
                'Perl::Critic::Mardem::Util',
                'Perl::Critic::Policy::Mardem::ProhibitBlockComplexity',
                'Perl::Critic::Policy::Mardem::ProhibitBlockComplexity',
                'Perl::Critic::Policy::Mardem::ProhibitConditionComplexity',
                'Perl::Critic::Policy::Mardem::ProhibitFileSize',
                'Perl::Critic::Policy::Mardem::ProhibitLargeBlock',
                'Perl::Critic::Policy::Mardem::ProhibitLargeFile',
                'Perl::Critic::Policy::Mardem::ProhibitLargeSub',
                'Perl::Critic::Policy::Mardem::ProhibitManyConditionsInSub',
                'Perl::Critic::Policy::Mardem::ProhibitReturnBooleanAsInt',
            ],
        );

        return 'ok';
    };

    if ( $EVAL_ERROR ) {
        say 'ERROR: ' . $EVAL_ERROR;
        return 1;
    }
    elsif ( 'ok' ne $eval_ok_test ) {
        say 'ERROR: eval not ok?';
        return 1;
    }
    else {
        return 0;
    }
}

exit main();

__END__

#-----------------------------------------------------------------------------
