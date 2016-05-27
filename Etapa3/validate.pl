#!/usr/bin/perl

use warnings;
use strict;
use utf8::all;
use Data::Dumper;

my ($VP, $FP, $FN, $VN);

# File with correct entities anotations
open(my $fh, "<", "res/entities.txt");

my $total_words = 1000; # Imagine a thousand words...

my %marked_entities;
my $total;
while(<$fh>) {
  my @entry = split / /, $_;
  # This is id->mark
  $marked_entities{$entry[0]} = $entry[1];
  $total++;
}

# File to match evaluate against res/entities.txt
open($fh, "<", "my_entities.txt");
my %to_evaluate_entities;
my $eval_total;
while(<$fh>) {
  my @entry = split / /, $_;
  # This is id->mark
  $to_evaluate_entities{$entry[0]} = $entry[1];
  $eval_total++;
}

# $FP = $eval_total - $total if $eval_total > $total;
$VP=$VN=$FN=0;

for my $id (keys %marked_entities) {
  if(! (exists $to_evaluate_entities{$id})) {
    $FP++;
  } elsif($marked_entities{$id} eq $to_evaluate_entities{$id}) {
    $VP++;
  } else {
    $FN++;
  }
}

$VN = $total_words - ($FP+$VP+$FN);

print "Matriz confusão\n";
print "|VP | FP|\n";
print "|---|---|\n";
print "|FN | VN|\n";
print "---------\n";
print "____________\n";
print "$VP $FP\n";
print "------------\n";
print "$FN $VN\n";
print "------------\n";

my ($precision, $recall, $accuracy, $f1);

$precision = $VP / ($VP + $FP);
$recall = $VP / ($VP + $FN);
$accuracy = ($VP+$VN) / ($VP+$VN+$FP+$FN);
$f1 = (2*$precision*$recall) / ($precision+$recall);

printf("%.4f\n", $precision);
printf("%.4f\n", $recall);
printf("%.4f\n", $accuracy);
printf("%.4f\n", $f1);
