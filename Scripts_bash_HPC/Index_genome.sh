#!/bin/bash

echo "START ------------------------------"

directory=$(pwd)

##wget -nc http://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.fa.gz -P $directory/refseq
##gunzip $directory/refseq/hg19.fa.gz
##mkdir index

bowtie2-build  -f $directory/refseq/hg19.fa $directory/index/hg19


echo "FINISH ------------------------------"
