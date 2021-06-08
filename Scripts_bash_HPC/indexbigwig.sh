echo "START ------------------------------"
directory=$(pwd)
read -p "Enter day : " day
cd $directory/sra/cardio/$day

cd finalbamfiles

samtools index ${day%}.H3K27ac.final.bam

bamCoverage -b ${day%}.H3K27ac.final.bam -o ${day%}.H3K27ac.bigwig -of bigwig --normalizeUsing RPGC --effectiveGenomeSize 2700000000 --numberOfProcessors max/2

echo "FINISH -------------------------------"

