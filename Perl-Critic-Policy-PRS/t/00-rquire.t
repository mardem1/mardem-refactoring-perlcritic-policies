#!perl

use utf8;

use 5.010;

use strict;
use warnings;

our $VERSION = '0.01';

use Test2::V0;
use Test2::Tools::Exception qw/lives/;

plan 'tests' => 7;

ok( lives {
        require Mardem::RefactoringPerlCriticPolicies::Util;
    }
);

ok( lives {
        require Perl::Critic::Policy::Mardem::ProhibitConditionComplexity;
    }
);

ok( lives {
        require Perl::Critic::Policy::Mardem::ProhibitBlockComplexity;
    }
);

ok( lives {
        require Perl::Critic::Policy::Mardem::ProhibitLargeSub;
    }
);

ok( lives {
        require Perl::Critic::Policy::Mardem::ProhibitLargeBlock;
    }
);

ok( lives {
        require Perl::Critic::Policy::Mardem::ProhibitManyConditionsInSub;
    }
);

ok( lives {
        require Perl::Critic::Policy::Mardem::ProhibitReturnBooleanAsInt;
    }
);

done_testing();

__END__

#-----------------------------------------------------------------------------

=pod

=encoding utf8

=head1 NAME

00-rquire.t

=head1 DESCRIPTION

Test-Script

=head1 AFFILIATION

This policy is part of L<Mardem::RefactoringPerlCriticPolicies|Mardem::RefactoringPerlCriticPolicies>.

=head1 AUTHOR

mardem, C<< <mardem at cpan.com> >>

=head1 COPYRIGHT

Copyright (c) 2022, mardem

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. The full text of this license
can be found in the LICENSE file included with this module.

=cut
