
# given an TPM matrix, log2 quantile normalization

#install if necessary
if (!("BiocManager" %in% installed.packages())) { install.packages("BiocManager", repos = "http://cran.us.r-project.org") }
if (!("preprocessCore" %in% installed.packages())) { BiocManager::install("preprocessCore") }
if (!("optparse" %in% installed.packages())) { install.packages("optparse", repos = "http://cran.us.r-project.org") }
#load package
library("preprocessCore")
library("optparse")

# get cmd call argument
option_list = list(
  make_option(c("-i", "--input"), type="character", default=NULL, 
              help="input file", metavar="character"),
  make_option(c("-o", "--output"), type="character", default=NULL, 
              help="output file", metavar="character")
);
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

####################################################################
# read in TPM data
all_df <- read.table(opt$input, sep="\t", header=TRUE, row.names=1)
# log2 transformation, log2(TPM+1)
log2data <- log2(data.matrix(all_df)+1)
# quantiles normalization
log2NormData = normalize.quantiles(as.matrix(log2data))
# copy row and col names
row.names(log2NormData) <- row.names(log2data)
colnames(log2NormData) <- colnames(log2data)
log2Norm_df<-data.frame(log2NormData)
# save normalized data to file
write.table(log2Norm_df,file=opt$output, sep="\t", col.names=NA)
####################################################################
# to call
# conda activate r_env
# Rscript log2_quantile_normalization.R -i mouse_rnaseq_f5cells_f5tissues_tpm.txt -o mouse_rnaseq_f5cells_f5tissues_tpm_log2norm.txt






