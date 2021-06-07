
echo "START ------------------------------"
directory=$(pwd)
read -p "Enter day : " day

cd $directory/sra/cardio/$day


cd bigwigoverbed

bigWigAverageOverBed *.bigwig *.bed  H3K27ac_${day%}_NCC.tab -minMax


echo "FINISH ------------------------------"
