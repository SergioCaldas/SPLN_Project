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

open (my $my_tabela_paises, "<", "../Tabelas/tabela_paises_g7.txt") or die ("Impossivel abrir o ficheiro tabela_paises_g7.txt\n");

while(<$my_tabela_paises>){
  chomp;
  @my_campos = split (/\,/, $_,4);
  $my_hash{$my_campos[0]}{$total}=$my_campos[1];
  $my_hash{$my_campos[0]}{$freq_abs}=$my_campos[2];
  $my_hash{$my_campos[0]}{$freq_log}=$my_campos[3];
}
close ($my_tabela_paises);

open (my $his_tabela_paises, "<", "../Grupo03/tabela_paises.txt") or die ("Impossivel abrir o ficheiro tabela_paises_g2.txt\n");

while(<$his_tabela_paises>){
  chomp;
  @his_campos = split (/\,/, $_,4);
  $his_hash{$his_campos[0]}{$total}=$his_campos[1];
  $his_hash{$his_campos[0]}{$freq_abs}=$his_campos[2];
  $his_hash{$his_campos[0]}{$freq_log}=$his_campos[3];
}

close ($his_tabela_paises);

my $tcidades = 0;

foreach my $my_cidade (sort keys %my_hash){
  if(exists $his_hash{$my_cidade}){
    $tcidades++;
    print "$my_cidade\n";
    print "\tTotal: $my_hash{$my_cidade}{$total} - $his_hash{$my_cidade}{$total}\n";
    print "\tFrequencia Absluta: $my_hash{$my_cidade}{$freq_abs} - $his_hash{$my_cidade}{$freq_abs}\n";
    print "\tFrequencia Logaritmica: $my_hash{$my_cidade}{$freq_log} - $his_hash{$my_cidade}{$freq_log}\n";
  }
}

print "\nTotal de Cidades em Comum entre os dois Grupos: $tcidades\n";
