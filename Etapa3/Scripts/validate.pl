#!/usr/bin/perl

=head1 Descricao da Script
  Esta script faz um reconhecimento dos nomes que constituem as noticias e verifica se eles existem numa lista. Posteriormente calcula as suas frequencias.
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

my $TP = 0;
my $FP = 0;
my $FN = 0;
my $TN = 0;
my $total = 0;
my $precision;
my $recall;
my $accuracy;
my $f1;
my $eval_total = 0;
my $total_words = 9455;
my %my_entities;
my %comp_entities;
my @entry;

=head1 Leitura do Ficheiro anotado manualmente
  Leitura do ficheiro anotado manualmente e guarda cada anotação na hash %my_anotations
=cut

open(my $myAnotations, "<", "../Análise do Algoritmo/Fabio/cidadesFabio.txt") or die ("Impossivel abrir o ficheiro nomes.txt\n");

while(<$myAnotations>) {
  @entry = split /,/, $_;
  # This is id->mark
  $my_entities{$entry[0]} = $entry[1];
  $total++;
}

=head1 Leitura do Ficheiro anotado computacionalmente
  Leitura do ficheiro anotado computacionalmente e guarda cada anotação na hash %my_anotations
=cut

open(my $compAnotations, "<", "../Análise do Algoritmo/Fabio/cidadesCompFabio.txt") or die ("Impossivel abrir o ficheiro nomes.txt\n");

while(<$compAnotations>) {
  @entry = split /,/, $_;
  # This is id->mark
  $comp_entities{$entry[0]} = $entry[1];
  $eval_total++;
}

=head1 
  ciclo que ...
=cut

for my $id (keys %my_entities){
  if(!(exists $comp_entities{$id})){
    $FP++;
  } elsif($my_entities{$id} eq $comp_entities{$id}){
    $TP++;
  } else {
    $FN++;
  }
}

$TN = $total_words - ($FP+$TP+$FN);

print "True Positive = $TP\nFalse Positive = $FP\n";
print "False Negative = $FN\nTrue Negative = $TN\n";

$precision = precision($TP,$FP);
$recall = recall($TP,$FN);
$accuracy = accuracy($TP,$TN,$FP,$FN);
$f1 = f1($precision,$recall);

printf("Precision = %.4f\n", $precision);
printf("Recall = %.4f\n", $recall);
printf("Accuracy = %.4f\n", $accuracy);
printf("F1 = %.4f\n", $f1);

sub  precision { 
  my $TP = shift;
  my $FP = shift;
  $precision = $TP / ($TP + $FP);
  return $precision;
};

sub  recall { 
  my $TP = shift;
  my $FN = shift;
  $recall = $TP / ($TP + $FN);
  return $recall;
};

sub  accuracy { 
  my $TP = shift;
  my $TN = shift;
  my $FP = shift;
  my $FN = shift;
  $accuracy = ($TP+$TN) / ($TP+$TN+$FP+$FN);
  return $accuracy;
};

sub  f1 { 
  my $precision = shift;
  my $recall = shift;
  $f1 = (2*$precision*$recall) / ($precision+$recall);
  return $f1;
};





