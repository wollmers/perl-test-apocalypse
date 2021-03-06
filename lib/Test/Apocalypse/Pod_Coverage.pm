package Test::Apocalypse::Pod_Coverage;

# ABSTRACT: Plugin for Test::Pod::Coverage

use Test::More;
use Test::Pod::Coverage 1.08;
use Pod::Coverage::TrustPod 0.092830;

sub do_test {
	TODO: {
		local $TODO = "Pod_Coverage";
		all_pod_coverage_ok( {
			coverage_class => 'Pod::Coverage::TrustPod',
		} );
	}

	return;
}

1;

=pod

=for Pod::Coverage do_test

=head1 DESCRIPTION

Encapsulates L<Test::Pod::Coverage> functionality. Automatically uses the L<Pod::Coverage::TrustPod> class.

=cut
