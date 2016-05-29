#!/usr/bin/perl

=head1 Descricao da Script
  Esta script faz uma comparacao das nossas frequencias com as frequencias calculadas pelo grupo 2 relativamente aos paises
=cut

=head1 Modulos
  Modulos usados nesta script
=cut

use Pod::Text;
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
  Funcao que abre a nossa tabela de paises e grava na variavel my_tabela_paises
=cut
open (my $my_tabela_paises, "<", "../Tabelas/tabela_paises_g7.txt") or die ("Impossivel abrir o ficheiro tabela_paises_g7.txt\n");

=head1 Preenchimenento das Hash's
  Este excerto de codigo preenche uma hash com a informacao dos nossos paises
=cut
while(<$my_tabela_paises>){
  chomp;
  @my_campos = split (/\,/, $_,4);
  $my_hash{$my_campos[0]}{$total}=$my_campos[1];
  $my_hash{$my_campos[0]}{$freq_abs}=$my_campos[2];
  $my_hash{$my_campos[0]}{$freq_log}=$my_campos[3];
}
close ($my_tabela_paises);

=head1 Open
  Funcao que abre a tabela de paises do grupo 2 e grava na variavel his_tabela_paises
=cut

open (my $his_tabela_paises, "<", "../Grupo16/tabela_paises_g16.txt") or die ("Impossivel abrir o ficheiro tabela_paises_g2.txt\n");

=head1 Preenchimenento das Hash's
  Este excerto de codigo preenche uma hash com a informacao dos paises do grupo 2
=cut

while(<$his_tabela_paises>){
  chomp;
  @his_campos = split (/\,/, $_,4);
  $his_hash{$his_campos[0]}{$total}=$his_campos[1];
  $his_hash{$his_campos[0]}{$freq_abs}=$his_campos[2];
  $his_hash{$his_campos[0]}{$freq_log}=$his_campos[3];
}

close ($his_tabela_paises);

my $tpaises = 0;

=head1 Print das frequencias dos dois grupos
  Este excerto de codigo faz um print dos paises em comum com os dois grupos
=cut
foreach my $my_paises (sort keys %my_hash){
  if(exists $his_hash{$my_paises}){
    $tpaises++;
    print "$my_paises,";
    print "$my_hash{$my_paises}{$total},$his_hash{$my_paises}{$total},";
    print "$my_hash{$my_paises}{$freq_abs},$his_hash{$my_paises}{$freq_abs},";
    print "$my_hash{$my_paises}{$freq_log},$his_hash{$my_paises}{$freq_log}\n";
  }
}

print "\nTotal de Cidades em Comum entre os dois Grupos: $tpaises\n";
