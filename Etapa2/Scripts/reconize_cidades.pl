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


my $total_palavras = 562346;
my %paises;
my %nomes;
my %cidades;

=head1 Open
  Funcao que abre as listas paises, nomes e cidades e grava nas variaveis file_paises, file_nomes e file_cidades respetivamente
=cut

open (my $file_paises, "<", "../DBs/paises.txt") or die ("Impossivel abrir o ficheiro paises.txt\n");
open (my $file_nomes, "<", "../DBs/nomes.txt") or die ("Impossivel abrir o ficheiro nomes.txt\n");
open (my $file_cidades, "<", "../DBs/cidades.txt") or die ("Impossivel abrir o ficheiro cidades.txt\n");

=head1 Leitura dos Ficheiros
  Leitura da ficheiro paises e guarda cada um dos paises na hash %paises
=cut

while(<$file_paises>){
  $_ = lc substr($_,0,(length($_)-1));
  $paises{$_}=0;
}

close ($file_paises);

=head1 Leitura dos Ficheiros
  Leitura da ficheiro nomes e guarda cada um dos paises na hash %nomes
=cut

while(<$file_nomes>){
  $_ = substr($_,0,(length($_)-1));
  $nomes{$_}=0;
}

close ($file_nomes);

=head1 Leitura dos Ficheiros
  Leitura da ficheiro cidades e guarda cada um dos paises na hash %cidades
=cut

while(<$file_cidades>){
  $_ = substr($_,0,(length($_)-1));
  $cidades{$_}=0;
}

close ($file_cidades);

=head1 Open
  Funcao que abre a nossa as nossas noticias e grava na variavel jb_file
=cut

open (my $jb_file, "<", "../jb.xml") or die ("Impossivel abrir o ficheiro jb.xml\n");

=head1 Nome Proprio
=cut

my $pm = qr{[[:upper:]]\w+};

=head1 Preposicoes
=cut

my $prep = qr{d[eoa`]s?};

=head1 Nome Proprio Composto
=cut

my $np = qr{$pm( ($prep )?$pm)*};

=head1 Contagem de Paises, Nomes e Cidades
  Leitura do ficheiro de noticias e contagem dos paises nomes e cidades que as constituem.
=cut

while (<$jb_file>){

  next if /^</; # ignore tags
  next if /<tag>.*/; #ignore text from tag tag
  next if /<t>.*/; # ignore text form tag t (title)
  next if /<sec>.*/; # ignore text form tag sec (section)

  while( /$np|\w+(-\w+)*/g ){
    my $palavra = $&;
    if(exists $paises{$palavra}){
      $paises{$palavra}++;
    }
    elsif(exists $nomes{$palavra}){
      $nomes{$palavra}++;
    }
    elsif(exists $cidades{$palavra}){
      $cidades{$palavra}++;
    }
  }
}

close ($jb_file);

=head1 Calculo das frequencias
  Neste excerto de codigo sao calculadas as frequencias das cidades.
=cut

foreach my $cidade (sort keys %cidades){
  if($cidades{$cidade} > 0){
    my $freq = ($cidades{$cidade}*1000000)/$total_palavras;
    $freq = sprintf("%.4f",$freq);
    my $log = log10($cidades{$cidade});
    $log = sprintf("%.4f",$log);
    print "$cidade,$cidades{$cidade},$freq,$log\n";
  }
}

=head1 Funcao logaritmo
  Funcao que calcula o logaritmo base 10 de n
=cut

sub log10{
  my $n = shift;
  return log($n)/log(10);
}
