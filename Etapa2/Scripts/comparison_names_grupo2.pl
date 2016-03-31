#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use utf8::all;

my @my_campos;
my @his_campos;
my %my_total;
my %his_total;
my %my_freq_abs;
my %my_freq_log;
my %his_freq_abs;
my %his_freq_log;

open (my $my_tabela_nomes, "<", "../Tabelas/tabela_nomes.txt") or die ("Impossivel abrir o ficheiro tabela_nomes.txt\n");

while(<$my_tabela_nomes>){
    chomp;
    @my_campos = split (/\|/, $_,4);
    $my_total{$my_campos[0]}=$my_campos[1];
    $my_freq_abs{$my_campos[0]}=$my_campos[2];
    $my_freq_log{$my_campos[0]}=$my_campos[3];
}
close ($my_tabela_nomes);

open (my $his_tabela_nomes, "<", "../Grupo2/nomes.txt") or die ("Impossivel abrir o ficheiro tabela_nomes.txt\n");

while(<$his_tabela_nomes>){
    chomp;
    @his_campos = split (/\,/, $_,4);
    $his_total{$his_campos[0]}=$his_campos[1];
    $his_freq_abs{$his_campos[0]}=$his_campos[2];
    $his_freq_log{$his_campos[0]}=$his_campos[3];
}

close ($his_tabela_nomes);

my $tnomes = 0;

foreach my $my_name (keys %my_total){
    if (exists $his_total{$my_name}){
      $tnomes++;
      print "$my_name:\n";
      print "\tTotal => $my_total{$my_name} | $his_total{$my_name}\n";
      print "\tFrequencia Absluta => $my_freq_abs{$my_name} | $his_freq_abs{$my_name}\n";
      print "\tFrequência Logaritmica => $my_freq_log{$my_name} | $his_freq_log{$my_name}\n";
    }
}
print "\nTotal de nomes em comum nos dois grupos = $tnomes\n";
