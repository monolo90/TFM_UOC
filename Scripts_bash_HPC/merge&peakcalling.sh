echo "START ------------------------------"
directory=$(pwd)
read -p "Enter day : " day
cd $directory/sra/cardio/$day

mkdir finalbamfiles
mkdir peakcalling

samtools merge -@40 ./finalbamfiles/${day%}.H3K27ac.final.bam ./bamfiles/*H3K27ac*final.bam
samtools merge -@40 ./finalbamfiles/${day%}.Input.final.bam ./bamfiles/*Input*final.bam

macs2 callpeak -t ./finalbamfiles/${day%}.H3K27ac.final.bam -c ./finalbamfiles/${day%}.Input.final.bam -f BAM -n H3K27ac.${day%} -p 0.01 -g 2.7e9 --outdir ./peakcalling --broad --broad-cutoff 0.01


echo "FINISH ------------------------------"
