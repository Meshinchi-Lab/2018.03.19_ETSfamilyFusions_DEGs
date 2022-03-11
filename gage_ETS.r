# library(stringr)
# library(magrittr)
# library(ggplot2)
# library(dplyr)
# library(tibble)
# library(tidyr)



setwd('/fh/fast/meshinchi_s/workingDir/TARGET/AML_TARGET/RNA/mRNAseq/analysis/2018.03.19_ETSfamilyFusions_DEGs/')
source("~/scripts/RNAseq_Analysis/DifferentialExpn_PathwayAnalysis/GAGE_GSEA_Function.r")
library(methods)

ETS.DEGs <- readRDS("TARGET_AML_1031_RBD_ETS.Family.Fusion_vs_OtherAML_DEGs_1.14.19.RDS")
filename <- paste0("TARGET_AML_RBD_ETS.Family.Mutations_vs_otherAML_GAGE")
C2.KEGG <- readRDS("~/RNA_seq_Analysis/0000.00.01_GSEA_geneSets_gmt/c2.cp.kegg.v6.0.symbols.RDS")



print("starting1")


GSA <-  gage_from_pipeline(twoGroups_DEGs.res=ETS.DEGs,type="expn",geneset=C2.KEGG)
# GSA <- lapply(Success.1031, gage_from_pipeline, type="expn",geneset=C2.KEGG)
  save(GSA,file=paste0(filename, "_expn_C2.KEGG.RData"))
  rm(GSA)
  gc()


print("done1")

# print("starting2")
# GSA.FC <- lapply(Success.1031, gage_from_pipeline, type="FC",geneset=C2.KEGG)
#   save(GSA.FC,file=paste0(filename, "_FC_C2.KEGG.RData"))
#   rm(GSA.FC)
#   gc()
#   
  
rm(C2.KEGG)  

# print("done2")

print("starting3")


C2.All <- readRDS("~/RNA_seq_Analysis/0000.00.01_GSEA_geneSets_gmt/c2.all.v6.0.symbols.RDS")

GSA.C2.All <-  gage_from_pipeline(twoGroups_DEGs.res=ETS.DEGs, type="expn", geneset=C2.All)
# GSA.C2.All <- lapply(Success.1031, gage_from_pipeline, type="expn",geneset=C2.All)
  save(GSA.C2.All,file=paste0(filename, "_expn_C2.All.RData"))
  rm(GSA.C2.All)
  gc()

rm(GSA.C2.All)
print("done3")


print("starting4")

GSA.KEGG <-  gage_from_pipeline(twoGroups_DEGs.res=ETS.DEGs, type="expn", geneset=NULL)
# GSA.KEGG <- lapply(Success.1031, gage_from_pipeline, type="expn",geneset=NULL) 
  save(GSA.KEGG,file=paste0(filename, "_expn_HSA.KEGG.RData"))
  rm(GSA.KEGG)
  gc()

print("done4")



  



