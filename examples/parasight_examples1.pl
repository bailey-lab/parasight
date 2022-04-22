#!/usr/bin/perl

##### MODULES ########
######################

use Getopt::Long;
use strict 'vars';


#DECLARE GLOBAL VARIABLES####################################################

use vars qw($program $pversion $pdescription $pgenerate $pusage);
$program = "$0";
$program =~ s/^.*\///;
### program stats ###
$pversion='1.2.040301';
$pdescription = "$program (ver:$pversion) executes examples of parasight";
$pusage="$program -example [# | ALL] [other options]";
$pgenerate= 'jeff:dnhc genetics:dn';
### program stats end ###

#####################################
###### GLOBAL VARIABLES #############
#####################################

use vars qw(%opt $perl);

###this variable allows for a specific version of parasight to be set####
# $parsight='parasight'  #standard setting


#####HELP###

$opt{'directory'}='data';
$opt{'parasight'}='parasight76.pl';


if (! defined $ARGV[0]) {
print "USAGE 
$pusage
DESCRIPTION\n$pdescription

-e(xample) [number]
-directory [path to examples directory]
  (default is $opt{'directory'})
-p(arasight) [parasight program to call]
  (default is $opt{'parasight'})

EXAMPLE 1 Is a tutorial that steps through the basic formatting and 
   display options for sequence and pairwise manipulations
	It uses fictious sequences and pairwise similarities.  
	
EXAMPLE 2 illustrates standard display of BLAST output showing a BAC
	query and sub(ject)s	The results of BAC blasted against all other 
	human BACs (GenBank nt and htg databases)
     
EXAMPLE 3 illustrates the -graph option for numeric data
   This exampel shows moving windows of % GC content 
   as well as a  second set of data

EXAMPLE 4 illusstrates -extra option for simple sequence features
   This example shows RepeatMasker output for AC002038 (BAC 101B6)
     	
EXAMPLE 5 miropeats example
	Display of the captured standard input of miropeats.
	
EXAMPLE 6 alignment and sequence retrieval
	Allows the retrieval of the underlying sequence as well as the text based sequence alignments.

EXAMPLE 7 clone AC002038 with depth of Celera sequence reads
   Demonstrates how manipulative you can get.  Uses -extra to display positions and values of moving 5 kb windows. 

";
exit;  
	
}
######################################################################################################
############################OPTION HANDLING ##########################################################
######################################################################################################
&GetOptions(\%opt, 'example=s', 'directory=s');
					
###LONG HELP ####

if ($opt{'help'}) {
	system "perldoc $0\n";
	exit;
}
if ($opt{'example'} eq 'ALL' ) {  die "INPUT ERROR: -example ALL is no longer is supported!\n"; }
if ( $opt{'example'} ==1  || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 1\n";
	my $command="$perl $opt{'parasight'} -align $opt{'directory'}/E1.alignments -precode file:$opt{'directory'}/E1.precode";
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	system "$command $die";
	print "DONE WITH EXAMPLE $opt{'example'}\n";
	print "TO EXECUTE THIS EXAMPLE FROM THE COMMAND LINE:\n$command\n";
	
}

if ( $opt{'example'} == 2 || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 2\n";
	my $command="$opt{'parasight'} -in $opt{'directory'}/E2 -precode file:$opt{'directory'}/E2.precode -showsub X: " ;
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
	system "$command $die";
	print "DONE WITH EXAMPLE $opt{'example'}\n";
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
}

if ( $opt{'example'} ==4  || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 4\n";
	my $command="$opt{'parasight'}  -showseq $opt{'directory'}/E4.show -extra $opt{'directory'}/E4.extra -precode file:$opt{'directory'}/E4.precode -options \"-canvas_bpwidth=>50000, -seq_line_spacing_wrap=>70, -extra_label_col=>7\"";
	
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	system "$command $die \n echo 'helloworld'; ";
	print "DONE WITH EXAMPLE $opt{'example'}\n";
	print "TO EXECUTE THIS EXAMPLE FROM THE COMMAND LINE:\n$command\n";
}#




if ( $opt{'example'} == 3  || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 3\n";
	my $command="$opt{'parasight'} -showseq $opt{'directory'}/E3.show  -graph1 $opt{'directory'}/E3.graphGC -graph2 $opt{'directory'}/E3.graphDEPTH -template $opt{'directory'}/E3.template.pst -precode file:$opt{'directory'}/E3.precode";
	
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
	system "$command $die";
	print "DONE WITH EXAMPLE $opt{'example'}\n";
	print "TO EXECUTE THIS EXAMPLE FROM THE COMMAND LINE:\n$command\n";
}

if ( $opt{'example'} == 4  || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 4\n";
	my $command="$opt{'parasight'} -in $opt{'directory'}/E4 -precode file:$opt{'directory'}/E4.precode" ;
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
	system "$command $die";
	print "DONE WITH EXAMPLE $opt{'example'}\n";
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
}

if ( $opt{'example'} == 5  || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 5\n";
	my $command="$opt{'parasight'}  -align $opt{'directory'}/E5.miropeats.stdout -precode file:$opt{'directory'}/E5.precode -options \"-sub_on=>0,-seq_line_spacing_wrap=>100 ,-pair_intra_line_on=>1\"";
	
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
	system "$command $die";
	print "DONE WITH EXAMPLE $opt{'example'}\n";
	print "TO DO THIS YOURSELF TYPE:\n$command\n";
	
}

if ( $opt{'example'} == 6 || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 6\n";
	my $command="$opt{'parasight'}  -align $opt{'directory'}/E6.align -precode file:$opt{'directory'}/E6.precode -options \"-fasta_directory=>$opt{'directory'}/E6_fasta\"";
	
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
	system "$command $die";
	print "DONE WITH EXAMPLE TWO\n";
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
}

if ( $opt{'example'} == 7 || $opt{'example'} eq 'ALL') {

	print "EXAMPLE 7\n";
	my $command="$opt{'parasight'}  -in $opt{'directory'}/E7";
	
	my $die = ''; #'-die';
	$die ='-die' if $opt{'example'} eq 'ALL';
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
	system "$command $die";
	print "DONE WITH EXAMPLE TWO\n";
	print "TO DO THIS YOUR SELF TYPE:\n$command\n";
}



