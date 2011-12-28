#!perl -T

use strict;
use warnings;
use utf8;

use Test::More tests => 13;
use Lingua::TH::Numbers;

# Change all the Test::More pipes to output utf8, to prevent
# "Wide character in print" warnings. This is only available for Perl 5.8+
# however due to the reliance on PerlIO, so earlier versions will fail with
# "Unknown discipline ':utf8'".
if ( $] > 5.008 )
{
	my $builder = Test::More->builder();
	binmode( $builder->output(), ":utf8" );
	binmode( $builder->failure_output(), ":utf8" );
	binmode( $builder->todo_output(), ":utf8" );
}


foreach my $line ( <DATA> )
{
	chomp( $line );
	next unless defined( $line ) && $line ne '';
	next if substr( $line, 0, 1 ) eq '#';
	
	my ( $input, $arabic_numerals ) = split( /\t/, $line );
	
	my $output;
	eval
	{
		$output = Lingua::TH::Numbers
			->new( $input )
			->arabic_numerals();
	};
	
	is(
		$output,
		$arabic_numerals,
		"Convert $input to Arabic numerals.",
	);
}

__DATA__
# Input	Arabic numerals
๐	0
๑	1
๒	2
๓	3
๔	4
๕	5
๖	6
๗	7
๘	8
๙	9
๑๐	10
๑๒๓๔๕๖๗๘๙	123456789
123456789	123456789
