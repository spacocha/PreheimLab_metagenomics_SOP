#! /usr/bin/perl -w

die "Use this to filter fastq from list of KO
Usage: list fasta > redirect\n" unless (@ARGV);
($tab, $fasta) = (@ARGV);
chomp ($tab);
chomp ($fasta);

open (IN, "<$tab" ) or die "Can't open $tab\n";
while ($line =<IN>){
    chomp ($line);
    next unless ($line);
    ($header, $KO)=split ("\t", $line);
    $keephash{$header}++;
}
close (IN);

$/=">";
open (IN, "<$fasta" ) or die "Can't open $fasta\n";
while ($line =<IN>){
    chomp ($line);
    next unless ($line);
    ($longheader, $seq)=split ("\n", $line);
    ($shortheader)=$longheader=~/^(.+?) \#/;
    #die "$longheader\n$shortheader\n";
    if ($keephash{$shortheader}){
    	print ">$line";
    }
}
close (IN);
