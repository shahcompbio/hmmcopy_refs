# Reference files for HMMcopy

This repo contains scripts to run hmmcopy utils to generate the reference wig files used by HMMcopy at different bin sizes. Pre-computed wig files are available on [zenodo](https://zenodo.org/record/5549581).

## Files

GC and mappability wig files at different bin sizes are provided in `wigfiles/${genome}/${genome}.gc.ws_${binsize}.wig` in the zenodo link.

## Generating the files from scratch

To generate these files you'll need a human reference genome and the HMMcopy toolkit. See the conda environment in `envs/`. Unfortunately this does not correctly install the perl scripts that are needed for some of the steps. To use this you'll need to install hmmcopy utils as described here: `https://github.com/shahcompbio/hmmcopy_utils`

### Step 1: generating the big wig file

The first step is to generate the big wig file. We provide these for a window size of 125bp in `references` in the zenodo link. See the script 001_generatebigwig.sh for a script to generate them. The window size should approximate the typical read length size of your experiments. We generally use either 100 or 150bp reads hence using 125.
The `generateMap.pl` script will look for a *fa.sizes file which has the length of each chromosome in the reference fasta. To generate these you can do the following.
```
cut -f1,2 grch38/genome.fa.fai > grch38/genome.fa.sizes
```

### Step 2: generating the wig files

Using the big wig file and the reference you can then generate the wig files with different bin sizes. See `002_generatewigreferences.sh`.