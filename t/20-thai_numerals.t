#!perl -T

use strict;
use warnings;
use utf8;

use Test::More tests => 13;
use Lingua::TH::Numbers;

# Change all the Test::More pipes to output utf8.
my $builder = Test::More->builder();
binmode( $builder->output(), ":utf8" );
binmode( $builder->failure_output(), ":utf8" );
binmode( $builder->todo_output(), ":utf8" );


foreach my $line ( <DATA> )
{
	chomp( $line );
	next unless defined( $line ) && $line ne '';
	next if substr( $line, 0, 1 ) eq '#';
	
	my ( $input, $thai_numerals ) = split( /\t/, $line );
	
	my $output;
	eval
	{
		$output = Lingua::TH::Numbers
			->new( $input )
			->thai_numerals();
	};
	
	is(
		$output,
		$thai_numerals,
		"Convert $input to Thai numerals.",
	);
}

__DATA__
# Input	Thai numerals
0	๐
1	๑
2	๒
3	๓
4	๔
5	๕
6	๖
7	๗
8	๘
9	๙
10	๑๐
123456789	๑๒๓๔๕๖๗๘๙
๑๒๓๔๕๖๗๘๙	๑๒๓๔๕๖๗๘๙
