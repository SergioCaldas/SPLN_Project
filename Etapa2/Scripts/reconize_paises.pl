#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use utf8::all;

my $total_palavras = 562346;
my %paises;
my %nomes;
my %cidades;

open (my $file_paises, "<", "../DBs/paises.txt") or die ("Impossivel abrir o ficheiro paises.txt\n");
open (my $file_nomes, "<", "../DBs/nomes.txt") or die ("Impossivel abrir o ficheiro nomes.txt\n");
open (my $file_cidades, "<", "../DBs/cidades.txt") or die ("Impossivel abrir o ficheiro cidades.txt\n");

while(<$file_paises>){
  $_ = lc substr($_,0,(length($_)-1));
  $paises{$_}=0;
}

close ($file_paises);

while(<$file_nomes>){
  $_ = lc substr($_,0,(length($_)-1));
  $nomes{$_}=0;
}

close ($file_paises);

while(<$file_cidades>){
  $_ = lc substr($_,0,(length($_)-1));
  $cidades{$_}=0;
}

close ($file_cidades);

open (my $jb_file, "<", "../jb.xml") or die ("Impossivel abrir o ficheiro jb.xml\n");

while (<$jb_file>){
  while( /\w+(-\w+)*/g ){
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
print "___________________PAISES__________________________\n";
print "| Pais\t| Total\t| Freq\t| Log\t|\n";
print "__________________________________________________\n";
my $tpaises;
foreach my $pais (keys %paises){
  if($paises{$pais} > 0){
    $tpaises++;
    my $freq = ($paises{$pais}*1000000)/$total_palavras;
    $freq = sprintf("%.2f",$freq);
    my $log = log10($paises{$pais});
    $log = sprintf("%.2f",$log);
    print "| $pais\t| $paises{$pais}\t| $freq\t| $log\t|\n";
  }
}
print "__________________________________________________\n";
print "Total de paises: $tpaises\n";

sub log10{
  my $n = shift;
  return log($n)/log(10);
}
