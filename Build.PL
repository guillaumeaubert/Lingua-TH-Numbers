use 5.008;
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
		'perl'                  => 5.008,
	},
	add_to_cleanup      =>
	[
		'Lingua-TH-Numbers-*',
	],
	create_makefile_pl  => 'traditional',
	configure_requires  =>
	{
		'Module::Build'         => 0,
	},
	meta_merge          =>
	{
		resources               =>
		{
			repository  => 'https://github.com/guillaumeaubert/Lingua-TH-Numbers',
			homepage    => 'https://metacpan.org/release/Lingua-TH-Numbers',
			bugtracker  => 'https://github.com/guillaumeaubert/Lingua-TH-Numbers/issues',
		},
	},
);

$builder->create_build_script();
