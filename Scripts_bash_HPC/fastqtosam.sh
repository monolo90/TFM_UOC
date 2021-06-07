echo "START ------------------------------"
read -p "Enter number of cores you can use : " cores
directory=$(pwd)
read -p "Enter day : " day
cd $directory/sra/cardio/$day
directory2=$(pwd)
mkdir samfiles
mkdir bamfiles
cd trimmed
for files in *.Rep[1-2-3-4].trimmed.fastq;do
     echo $files
     name=$(echo $files | sed 's/.trimmed.fastq//')
     echo $name
     bowtie2  -p $cores -x $directory/index/hg19 -U $files -S $directory2/samfiles/${name%}.sam 2> $directory2/samfiles/${name%}.log
     samtools view -@ $cores -S -b -q 10 $directory2/samfiles/${name%}.sam > $directory2/bamfiles/${name%}.quality.bam 
     samtools sort -@ $cores -n  -o $directory2/bamfiles/${name%}.sorted1.bam -O BAM $directory2/bamfiles/${name%}.quality.bam 
     samtools fixmate -@ $cores -m $directory2/bamfiles/${name%}.sorted1.bam $directory2/bamfiles/${name%}.fixmate.bam
     samtools sort -@ $cores -o $directory2/bamfiles/${name%}.sorted2.bam $directory2/bamfiles/${name%}.fixmate.bam
     samtools markdup -@ $cores -r -s $directory2/bamfiles/${name%}.sorted2.bam $directory2/bamfiles/${name%}.final.bam 2> $directory2/bamfiles/${name%}.final.log
     echo " ------------------------------------------------------------------"
     echo $directory2/bamfiles/${name%}.final.bam
     echo " ------------------------------------------------------------------"
     ##samtools merge merged.bam ga.bam 454.bam
done

cd $directory
echo "FINISH ------------------------------"
