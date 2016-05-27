#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use utf8::all;

my $total_palavras = 562346;
my %paises;
my %nomes;
my %cidades;
my %freq;

open (my $file_paises, "<", "../DBs/cetenFolha_lista_palavras.txt") or die ("Impossivel abrir o ficheiro centenFolha_lista_palavras.txt\n");
while(<$file_paises>){
  $_ = substr($_,0,(length($_)-1));
  $paises{$_}=0;
}

close ($file_paises);


open (my $jb_file, "<", "../jb.xml") or die ("Impossivel abrir o ficheiro jb.xml\n");

while (<$jb_file>){

  next if /^</; # ignore tags
  next if /<tag>.*/; #ignore text from tag tag
  next if /<t>.*/; # ignore text form tag t (title)
  next if /<sec>.*/; # ignore text form tag sec (section)
  
  while(/(\w+)*/g){
    my $palavra = $&;
    if(exists $paises{$palavra}){
      $paises{$palavra}++;
    }
    
  }
}

close ($jb_file);

foreach my $name (sort keys %paises){
  if($paises{$name} > 0){
    my $freq = ($paises{$name}*1000000)/$total_palavras;
    $freq = sprintf("%.4f",$freq);
    my $log = log10($paises{$name});
    $log = sprintf("%.4f",$log);
    print "$name  $paises{$name}  $freq $log\n";
  }
}


sub log10{
  my $n = shift;
  return log($n)/log(10);
}
