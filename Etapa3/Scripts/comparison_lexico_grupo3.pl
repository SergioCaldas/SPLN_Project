#!/usr/bin/perl 

use warnings;
use strict;
use Data::Dumper;
use utf8::all;

=head1 Variaveis
  Variaveis utilizadas neste script
=cut

my @my_campos;
my @his_campos;
my %my_hash;
my %his_hash;
my $total = "Total";
my $freq_abs = "Freq Abs";
my $freq_log = "Freq Log";


open (my $f, "<", "../Tabelas/g7_lexico.txt") or die ("Impossivel abrir o ficheiro tabela_nomes_g7.txt\n");
my $totalg7 = 0;

while(<$f>)
{
  chomp;
  @my_campos = split (/\,/, $_,4);
  $my_hash{$my_campos[0]}{$total}=$my_campos[1];
  $my_hash{$my_campos[0]}{$freq_abs}=$my_campos[2];
  $my_hash{$my_campos[0]}{$freq_log}=$my_campos[3];
}
close($f);

open(my $fg02,'<', "../Grupo03/tabela_lexico.txt") or die ("Impossivel abrir o ficheiro tabela_nomes_g7.txt\n");

#open(my $fg02,'<:encoding(UTF-8)', "./tabela_lexico_g02.txt") or die $!;
my $totalGr02 = 0;

while(<$fg02>)
{
  chomp;
  @his_campos = split (/\,/, $_,4);
  $his_hash{$his_campos[0]}{$total}=$his_campos[1];
  $his_hash{$his_campos[0]}{$freq_abs}=$his_campos[2];
  $his_hash{$his_campos[0]}{$freq_log}=$his_campos[3];
}
close($fg02);


foreach my $my_lexico (sort keys %my_hash){
  if(exists $his_hash{$my_lexico}){
  print "$my_lexico,";
    print "$my_hash{$my_lexico}{$total},$his_hash{$my_lexico}{$total},";
    print "$my_hash{$my_lexico}{$freq_abs},$his_hash{$my_lexico}{$freq_abs},";
    print "$my_hash{$my_lexico}{$freq_log},$his_hash{$my_lexico}{$freq_log}\n";
    
  }
  
}
