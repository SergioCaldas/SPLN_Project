#!/usr/bin/perl

=head1 Descricao da Script
  Esta script faz uma comparacao das nossas frequencias com as frequencias calculadas pelo grupo 16 relativamente aos nomes
=cut

=head1 Modulos
  Modulos usados nesta script
=cut

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

=head1 Open
  Funcao que abre a nossa tabela de nomes e grava na variavel my_tabela_nomes
=cut

open (my $my_tabela_nomes, "<", "../Tabelas/tabela_nomes_g7.txt") or die ("Impossivel abrir o ficheiro tabela_nomes_g7.txt\n");

=head1 Preenchimenento das Hash's
  Este excerto de codigo preenche uma hash com a informacao dos nomes da nossa tabela
=cut

while(<$my_tabela_nomes>){
  chomp;
  @my_campos = split (/\,/, $_,4);
  $my_hash{$my_campos[0]}{$total}=$my_campos[1];
  $my_hash{$my_campos[0]}{$freq_abs}=$my_campos[2];
  $my_hash{$my_campos[0]}{$freq_log}=$my_campos[3];
}
close ($my_tabela_nomes);

=head1 Open
  Funcao que abre a tabela de nomes do grupo 16 e grava na variavel his_tabela_nomes
=cut

open (my $his_tabela_nomes, "<", "../Grupo16/tabela_nomes.txt") or die ("Impossivel abrir o ficheiro tabela_nomes.txt\n");

=head1 Preenchimenento das Hash's
  Este excerto de codigo preenche uma hash com a informacao dos nomes do grupo 16
=cut

while(<$his_tabela_nomes>){
  chomp;
  @his_campos = split (/\,/,$_,4);
  $his_hash{$his_campos[0]}{$total}=$his_campos[1];
  $his_hash{$his_campos[0]}{$freq_abs}=$his_campos[2];
  $his_hash{$his_campos[0]}{$freq_log}=$his_campos[3];
}

close ($his_tabela_nomes);

my $tnomes = 0;

=head1 Print das frequencias dos dois grupos
  Este excerto de codigo faz um print dos nomes em comum com os dois grupos
=cut

foreach my $my_name (sort keys %my_hash){
  if(exists $his_hash{$my_name}){
    $tnomes++;
    print "$my_name\n";
    print "\tTotal: $my_hash{$my_name}{$total} - $his_hash{$my_name}{$total}\n";
    print "\tFrequencia Absluta: $my_hash{$my_name}{$freq_abs} - $his_hash{$my_name}{$freq_abs}\n";
    print "\tFrequencia Logaritmica: $my_hash{$my_name}{$freq_log} - $his_hash{$my_name}{$freq_log}\n";
  }
}

print "\nTotal de Nomes em Comum entre os dois Grupos: $tnomes\n";

