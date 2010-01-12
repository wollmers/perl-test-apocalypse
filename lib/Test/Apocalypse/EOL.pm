# Declare our package
package Test::Apocalypse::EOL;
use strict; use warnings;

# Initialize our version
use vars qw( $VERSION );
$VERSION = '0.07';

use Test::More;

sub do_test {
	my %MODULES = (
		'Test::EOL'	=> '0.3',
	);

	while (my ($module, $version) = each %MODULES) {
		eval "use $module $version";	## no critic ( ProhibitStringyEval )
		next unless $@;

		if ( $ENV{RELEASE_TESTING} ) {
			die 'Could not load release-testing module ' . $module . " -> $@";
		} else {
			plan skip_all => $module . ' not available for testing';
		}
	}

	# Run the test!
	all_perl_files_ok();

	return;
}

1;
__END__
=head1 NAME

Test::Apocalypse::EOL - Plugin for Test::EOL

=head1 SYNOPSIS

	die "Don't use this module directly. Please use Test::Apocalypse instead.";

=head1 ABSTRACT

Encapsulates Test::EOL functionality.

=head1 DESCRIPTION

Encapsulates Test::EOL functionality.

=head2 do_test()

The main entry point for this plugin. Automatically called by L<Test::Apocalypse>, you don't need to know anything more :)

=head1 SEE ALSO

L<Test::Apocalypse>

L<Test::Pod>

=head1 AUTHOR

Apocalypse E<lt>apocal@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010 by Apocalypse

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
