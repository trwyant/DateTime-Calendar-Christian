use strict;
BEGIN { $^W = 1 }

use Test::More tests => 6;
use DateTime::Calendar::Christian;

#########################

my $d;

$d = DateTime::Calendar::Christian->new( year  => 1582,
                                         month => 1,
                                         day   => 1,
                                         time_zone => 'floating' );

$d->set( month => 11 );
is($d->ymd, '1582-11-01', 'correct date after setting month');
ok($d->is_gregorian, 'is_gregorian after setting month');

$d->set( year => 1581 );
is($d->ymd, '1581-11-01', 'correct date after setting year');
ok($d->is_julian, 'is_julian after setting year');

$d = DateTime::Calendar::Christian->new( year  => 1582,
                                         month => 10,
                                         day   => 1,
                                         time_zone => 'floating' );

$d->set( day => 10 );
is($d->ymd, '1582-10-20', 'correct date (missing day)');
ok($d->is_gregorian, 'is_gregorian (missing day)');
