#!/usr/bin/perl -w
use strict;

=pod

=head1 NAME

clean_tmp.pl

=head1 SYNOPSIS

This script is designed to be run from cron. To run it nightly at 2am put a like
like this in the crontab for the web server user (often "nobody"):

    0 2 * * * /usr/local/bricolage/bin/clean_tmp.pl

=head1 DESCRIPTION

clean_tmp.pl will delete files from the tmp directories used by Bricolage which
are over a 12 hours old. This will prevent Bricolage from filling up your hard
drive with stale lockfiles and other viscera.

=head1 AUTHOR

Sam Tregar <stregar@about-inc.com>

=cut

BEGIN {
    use File::Spec::Functions ();
    $ENV{BRICOLAGE_ROOT} ||= '/usr/local/bricolage';
    unshift(@INC, File::Spec::Functions::catdir($ENV{BRICOLAGE_ROOT}, 'lib'));
};

use Bric::Util::Trans::FS;
use File::Find qw(find);
use Getopt::Std;

our ($opt_s, $opt_h);
getopts('s:h');

usage() if $opt_h;

my $tmpdir = File::Spec->tmpdir();
die "Unable to find tmp dir using File::Spec::tmp_dir()!"
  unless $tmpdir;

# Get the cutoff epoch.
$opt_s ||= 12 * 60 * 60;
my $cutoff = time - $opt_s;

# find and delete old files
find(sub {
	 if (-f and (stat(_))[8] < $cutoff) {
	     unlink($_) or die "Unable to delete $File::Find::name: $!";
	 }
     },
     Bric::Util::Trans::FS->cat_dir($tmpdir, "bricolage")
    );

sub usage {
    my $prog = Bric::Util::Trans::FS->base_name($0);
    print qq{
Usage: $prog [opts]

Supported Options:

  -s Number of seconds since last file access that must be exceeded before
     deleting a file. Defaults to 43200 (12 hours). Note that this value should
     be less than the interval at which $prog is run. If $prog is run every 24
     hours (86400 seconds), the -s argument should be less than 86400.
     Otherwise, no files will ever be deleted, because $prog itself accesses
     each file.

  -h Prints this brief usage statment.

};
}
