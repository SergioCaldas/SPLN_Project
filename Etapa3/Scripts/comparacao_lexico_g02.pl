#!/usr/bin/perl 

use warnings;
use strict;
use utf8::all;
use Data::Dumper;
use Lingua::Jspell;
use Memoize;

my %words;
my $dic = Lingua::Jspell->new("pt");

open (my $f, "<", "../Tabelas/g7_lexico.txt") or die ("Impossivel abrir o ficheiro tabela_nomes_g7.txt\n");
my $totalg7 = 0;

while(<$f>)
{
	my @line = split(/,/,$_); 
	my $word = $line[0];
	my $freqabs = $line[1];

	$words{$word}{'g7'} += $freqabs;
    $totalg7 += $freqabs;
}
close($f);
open(my $fg02,'<:encoding(UTF-8)', "../Grupo16/tabela_lexico_corrigida_g16.txt") or die $!;

#open(my $fg02,'<:encoding(UTF-8)', "./tabela_lexico_g02.txt") or die $!;
my $totalGr02 = 0;

while(<$fg02>)
{
	my @line = split(/,/,$_);
	my $word = $line[0];
	my $freqabs = $line[1];
	
	next if($word =~ /[0-9]+|\_/);
	next if($word =~ /^[^aAáÁàÀeEéÉoO]$/);
	next if(!$dic->fea($word));

	$words{$word}{'gr02'} += $freqabs;
	$totalGr02 += $freqabs;
}
close($fg02);

print "//--- Comparação de ocorrências lexicais entre grupos ---//\n";
print "//--- Palavra | g16 (Angola) | g02 (Portugal) ---//\n\n";

foreach my $word (sort keys %words)
{
	printf("%-20s | ",$word);

	if(exists $words{$word}{'g7'})
	{
		my $freq = ($words{$word}{'g7'}/$totalg7)*1000000;
		printf("%d, %-12.4f | ",$words{$word}{'g7'},$freq);
	}
	else { print "0               | "; }

	if(exists $words{$word}{'gr02'})
	{
		my $freq = ($words{$word}{'gr02'}/$totalGr02)*1000000;
		printf("%d, %.4f\n",$words{$word}{'gr02'},$freq);
	}
	else { print "0\n"; }
}








