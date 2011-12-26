#!perl -T

use strict;
use warnings;
use utf8;

use Test::More tests => 12;
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
	
	my ( $input, $is_valid ) = split( /\t/, $line );
	
	eval
	{
		my $number = Lingua::TH::Numbers->new( $input );
	};
	
	is(
		$@ ? 'Invalid input' : 'Valid input',
		$is_valid ne 'Yes' ? 'Invalid input' : 'Valid input',
		"Build an object with $input as input.",
	);
}

__DATA__
# Input	Valid
๐	Yes
0	Yes
10	Yes
-10	Yes
๑๐	Yes
-๑๐	Yes
3.14	Yes
๑.๐๒	Yes
-3.14	Yes
-๑.๐๒	Yes
A	No
ล้าน	No
