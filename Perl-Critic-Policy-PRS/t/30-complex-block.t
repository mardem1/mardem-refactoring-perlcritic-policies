#!perl

use 5.010;

use strict;
use warnings;

our $VERSION = '0.01';

use Carp qw( verbose );
use Carp::Always;

use Readonly;
use Test::More;
use Perl::Critic;
use Perl::Critic::Utils qw{ :severities };

Readonly::Scalar my $POLICY_NAME => 'Perl::Critic::Policy::PRS::ProhibitBlockComplexity';

Readonly::Scalar my $MCC_VALUE_1 => 1;
Readonly::Scalar my $MCC_VALUE_2 => 2;
Readonly::Scalar my $MCC_VALUE_4 => 4;

plan tests => 4;

#####

sub _get_perl_critic_object
{
    my @configs = @_;

    my $pc = Perl::Critic->new(
        -profile  => 'NONE',
        -only     => 1,
        -severity => 1,
        -force    => 0
    );

    $pc->add_policy( -policy => $POLICY_NAME, @configs );

    return $pc;
}

#####

sub _check_perl_critic
{
    my ( $code_ref, $max_mccabe ) = @_;

    my @params = ();
    if ($max_mccabe) {
        @params = ( -params => { max_mccabe => $max_mccabe } );
    }

    my $pc = _get_perl_critic_object(@params);

    return $pc->critique($code_ref);
}

#####

{
    my $code = <<'END_OF_STRING';
        # empty code
END_OF_STRING

    my @violations = _check_perl_critic( \$code );

    ok !@violations, 'empty code ok';
}

#####

{
    my $code = <<'END_OF_STRING';
        if(1) {
            # empty code block
        }
END_OF_STRING

    my @violations = _check_perl_critic( \$code );

    ok !@violations, 'empty code block ok';
}

#####

{
    my $code = <<'END_OF_STRING';
        if( 1 == 0 && 2 == 3 || 4 == 6 ) {
            print 'test not reached';
        }
END_OF_STRING

    my @violations = _check_perl_critic( \$code );

    ok !@violations, 'simple if code block ok';
}

#####

{
    my $code = <<'END_OF_STRING';
        if( 1 ) {
            if( 1 == 0 && 2 == 3 || 4 == 6 ) {
                print 'test not reached';
            }
        }
END_OF_STRING

    my @violations = _check_perl_critic( \$code );

    ok !!@violations, 'complex if code block with inner if';
}

#####

done_testing();