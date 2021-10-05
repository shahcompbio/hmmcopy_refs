
#!/bin/bash
#BSUB -J wigfiles
#BSUB -n 10
#BSUB -R rusage[mem=10]
#BSUB -W 240:00
#BSUB -e %J.stderr
#BSUB -o %J.stdout

source ~/miniconda3/etc/profile.d/conda.sh
conda activate hmmcopy

grch37=grch37/GRCh37-lite.fa
grch38=grch38/genome.fa

for binsize in 100 200 500 1000 10000 20000 50000 100000 200000 500000 1000000 2000000 5000000
    do
    echo ${binsize}
    mapCounter -w ${binsize} -c 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,X,Y references/GRCh37-lite.ws_125.bw > wigfiles/grch37/GRCh37-lite.map.ws_${binsize}.wig
    gcCounter -w ${binsize} -c 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,X,Y ${grch37} > wigfiles/grch37/GRCh37-lite.gc.ws_${binsize}.wig
done

for binsize in 100 200 500 1000 10000 20000 50000 100000 200000 500000 1000000 2000000 5000000
    do
    echo ${binsize}
    mapCounter -w ${binsize} -c chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY references/GRCh38.ws_125.bw > wigfiles/grch38/GRCh38.map.ws_${binsize}.wig
    gcCounter -w ${binsize} -c chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY ${grch38} > wigfiles/grch38/GRCh38.gc.ws_${binsize}.wig
done

