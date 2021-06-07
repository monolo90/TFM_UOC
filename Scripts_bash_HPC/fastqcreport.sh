#!/bin/bash

echo "START ------------------------------"

directory=$(pwd)

read -p "Enter day : " day

cd $directory/sra/cardio/$day ## aqui anadir el dia

mkdir FASTQC_reports

fastqc *.Rep[1-2-3-4].fastq --outdir FASTQC_reports/

cd trimmed

mkdir FASTQC_reports

fastqc *.Rep[1-2-3-4].trimmed.fastq --outdir FASTQC_reports/

cd $directory

echo "FINISH ------------------------------"
