#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use utf8::all;

my @my_campos;
my @his_campos;
my %my_hash;
my %his_hash;
my $total = "Total";
my $freq_abs = "Freq Abs";
my $freq_log = "Freq Log";

open (my $my_tabela_nomes, "<", "../Tabelas/tabela_nomes_g7.txt") or die ("Impossivel abrir o ficheiro tabela_nomes.txt\n");

while(<$my_tabela_nomes>){
  chomp;
  @my_campos = split (/\,/, $_,4);
  $my_hash{$my_campos[0]}{$total}=$my_campos[1];
  $my_hash{$my_campos[0]}{$freq_abs}=$my_campos[2];
  $my_hash{$my_campos[0]}{$freq_log}=$my_campos[3];
}
close ($my_tabela_nomes);

open (my $his_tabela_nomes, "<", "../Grupo2/nomes.txt") or die ("Impossivel abrir o ficheiro tabela_nomes.txt\n");

while(<$his_tabela_nomes>){
  chomp;
  @his_campos = split (/\,/, $_,4);
  $his_hash{$his_campos[0]}{$total}=$his_campos[1];
  $his_hash{$his_campos[0]}{$freq_abs}=$his_campos[2];
  $his_hash{$his_campos[0]}{$freq_log}=$his_campos[3];
}

close ($his_tabela_nomes);

my $tnomes = 0;

foreach my $my_name (sort keys %my_hash){
  if(exists $his_hash{lc $my_name}){
    $tnomes++;
    print "$my_name\n";
    print "\tTotal: $my_hash{$my_name}{$total} - $his_hash{lc $my_name}{$total}\n";
    print "\tFrequencia Absluta: $my_hash{$my_name}{$freq_abs} - $his_hash{lc $my_name}{$freq_abs}\n";
    print "\tFrequencia Logaritmica: $my_hash{$my_name}{$freq_log} - $his_hash{lc $my_name}{$freq_log}\n";
  }
}

print "\nTotal de Nomes em Comum entre os dois Grupos: $tnomes\n";

