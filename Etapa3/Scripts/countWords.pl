#!/usr/bin/perl

=head1 Descricao da Script
  Esta script faz um reconhecimento das cidades que constituem as noticias e verifica se elas existem numa lista. Posteriormente calcula as suas frequencias.
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

my $total_palavras = 1882303;
my $totalWords = 0;

=head1 Open
  Funcao que abre a nossa as nossas noticias e grava na variavel jb_file
=cut

open (my $jb_file, "<", "../Acidos.xml") or die ("Impossivel abrir o ficheiro jb.xml\n");

=head1 Contagem de Cidades
  Leitura do ficheiro de noticias e contagem das cidades.
=cut

while (<$jb_file>){

  next if /<.*>.*/; #ignore text from tags

  while(/(\w+)*/g){
    
    my $palavra = $&;
    if (!($palavra eq "")){
      $totalWords++;
      print "$totalWords   -   $palavra\n";
    }
  }
}

close ($jb_file);

=head1 Contagem de palavras
  Total de palavras
=cut

print "$totalWords\n";

=head1 Funcao logaritmo
  Funcao que calcula o logaritmo base 10 de n
=cut

sub log10{
  my $n = shift;
  return log($n)/log(10);
}

=head1 Funcao trim
  Funcao que remove os espaços iniciais e finais
=cut

sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

