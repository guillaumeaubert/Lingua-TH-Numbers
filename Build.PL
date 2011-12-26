use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'Lingua::TH::Numbers',
	license             => 'artistic',
	dist_author         => q{Guillaume Aubert <aubertg@cpan.org>},
	dist_version_from   => 'lib/Lingua/TH/Numbers.pm',
	build_requires      =>
	{
		'Carp'                  => 0,
		'Data::Dumper'          => 0,
		'Test::More'            => 0,
	},
	requires            =>
	{
		'perl'                  => 5.006,
	},
	add_to_cleanup      =>
	[
		'Lingua-TH-Numbers-*',
	],
	create_makefile_pl  => 'traditional',
);

$builder->create_build_script();
