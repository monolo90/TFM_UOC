#!/bin/bash

echo "START ------------------------------"
read -p "Enter number of cores you can use : " cores
directory=$(pwd)

read -p "Enter day : " day

cd $directory/sra/cardio/$day ## aqui anadir el dia
mkdir trimmed

for files in *.Rep[1-2-3-4].fastq;do
     echo $files
     
     name=$(echo $files | sed 's/.fastq//')
     echo $name
     trimmomatic SE -threads $cores $files ./trimmed/${name%}.trimmed.fastq \
     ILLUMINACLIP:/comun/alvaro/radauser1/IluminaAdapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 2> ./trimmed/${name%}.trimmed.log

done

cd $directory

echo "FINISH -----------------------------"

