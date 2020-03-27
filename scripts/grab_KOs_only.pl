#! /usr/bin/perl -w
#
#

	die "Usage: list> Redirect\n" unless (@ARGV);
($list) = (@ARGV);
chomp ($list);
$verbose=0;

print "Processing list $list\n" if ($verbose);
open (IN, "<${list}") or die "Can't open $list\n";
while ($line=<IN>){
    chomp ($line);
    next unless ($line);
    open (IN2, "<${line}") or die "Can't open $line\n";
    while ($line2=<IN2>){
	chomp ($line2);
	next unless ($line2);
	(@pieces)=split ("\t", $line2);
	print "$line2\n" if ($pieces[1]);
    }
    close (IN2);
}
close (IN);
