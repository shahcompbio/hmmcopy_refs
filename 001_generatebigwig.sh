#!/bin/bash
#BSUB -J hmmcopy
#BSUB -n 10
#BSUB -R rusage[mem=10]
#BSUB -W 240:00
#BSUB -e %J.stderr
#BSUB -o %J.stdout

grch37=grch37/GRCh37-lite.fa
grch38=grch38/genome.fa

source ~/miniconda3/etc/profile.d/conda.sh
conda activate hmmcopy
# add -b to the below commands if the references don't have a bowtie index
# generateMap.pl -w 125 ${grch37} -o references/GRCh37-lite.ws_125.bw
generateMap.pl -w 125 ${grch38} -o references/GRCh38.ws_125.bw
