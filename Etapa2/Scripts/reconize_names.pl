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
  $_ = substr($_,0,(length($_)-1));
  $paises{$_}=0;
}

close ($file_paises);

while(<$file_nomes>){
  $_ = substr($_,0,(length($_)-1));
  $nomes{$_}=0;
}

close ($file_paises);

while(<$file_cidades>){
  $_ = substr($_,0,(length($_)-1));
  $cidades{$_}=0;
}

close ($file_cidades);

open (my $jb_file, "<", "../jb.xml") or die ("Impossivel abrir o ficheiro jb.xml\n");

while (<$jb_file>){
  while(/([A-Z]\w+)([\s-][A-Z]\w+)*/g){
    my $palavra = $&;
    if(exists $paises{$1}){
      $paises{$palavra}++;
    }
    elsif(exists $nomes{$1}){
      $nomes{$palavra}++;
    }
    elsif(exists $cidades{$1}){
      $cidades{$palavra}++;
    }
  }
}

close ($jb_file);

foreach my $name (sort keys %nomes){
  if($nomes{$name} > 0){
    my $freq = ($nomes{$name}*1000000)/$total_palavras;
    $freq = sprintf("%.4f",$freq);
    my $log = log10($nomes{$name});
    $log = sprintf("%.4f",$log);
    print "$name,$nomes{$name},$freq,$log\n";
  }
}

sub log10{
  my $n = shift;
  return log($n)/log(10);
}
