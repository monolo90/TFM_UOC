
setwd("~/Escritorio/PEAKS/RNA")
library(readr)
GSM3262972_RZY634_RNA_D5_1_chrM <- read_delim("GSM3262972_RZY634_RNA_D5_1-chrM.rpkm", 
                                                "\t", escape_double = FALSE, trim_ws = TRUE)
GSM3262973_RZY640_RNA_D5_2_chrM <- read_delim("GSM3262973_RZY640_RNA_D5_2-chrM.rpkm", 
                                              "\t", escape_double = FALSE, trim_ws = TRUE)

RNA_day5_merge <- merge(x = GSM3262972_RZY634_RNA_D5_1_chrM, 
                             y = GSM3262972_RZY634_RNA_D5_1_chrM,
                             by = c("Geneid"))

RNA_day5_merge <- RNA_day5_merge[,c("Geneid","bam.RZY634_RNA_D5_1.nodup.bam.x",
                                    "bam.RZY634_RNA_D5_1.nodup.bam.y")] 



library(biomaRt)
mart <- useEnsembl(biomart = "ensembl", 
                   dataset = "hsapiens_gene_ensembl", 
                   version = "GRCh37")
 RNA_day5_id= getBM(
  values = trimws(GSM3262972_RZY634_RNA_D5_1_chrM$Geneid),
  filters = c("external_gene_name"),
  attributes = c("ensembl_gene_id","external_gene_name"),
  uniqueRows = FALSE,
  mart = mart
)

library(tidyverse)
RNA_day5_id <- RNA_day5_id[!duplicated(RNA_day5_id$external_gene_name),  ]

RNA_day5_final <- merge(x = RNA_day5_merge, 
                        y = RNA_day5_id,
                        by.x = c("Geneid"),
                        by.y = c("external_gene_name"))
#RNA_day5_id <- RNA_day5_id %>% group_by(external_gene_name)%>% 
 # nest()

RNA_day5 <-data.frame(row.names = RNA_day5_final$ensembl_gene_id, ens_id = RNA_day5_final$ensembl_gene_id, 
                      gene_name = RNA_day5_final$Geneid, 
                      day5=rowMeans(data.frame(RNA_day5_final$bam.RZY634_RNA_D5_1.nodup.bam.x, RNA_day5_final$bam.RZY634_RNA_D5_1.nodup.bam.y)))

GSM3262974_RZY635_RNA_D7_1_chrM <- read_delim("GSM3262974_RZY635_RNA_D7_1-chrM.rpkm", 
                                             "\t", escape_double = FALSE, trim_ws = TRUE)

GSM3262975_RZY641_RNA_D7_2_chrM <- read_delim("GSM3262975_RZY641_RNA_D7_2-chrM.rpkm", 
                                              "\t", escape_double = FALSE, trim_ws = TRUE)

RNA_day7_merge <- merge(x = GSM3262974_RZY635_RNA_D7_1_chrM, 
                        y = GSM3262975_RZY641_RNA_D7_2_chrM,
                        by = c("Geneid"))
grep("bam", names(RNA_day7_merge))
RNA_day7_merge <- RNA_day7_merge[,c(1,7,13),] 

RNA_day5_7  <- merge(x = RNA_day5, 
               y = RNA_day7_merge,
               by.x = c("gene_name"),
               by.y = c("Geneid"))
add_col  <- rowMeans(RNA_day5_7[,c(-2,-1)])
RNA_day5_7  <- RNA_day5_7[,-c(4,5)]
RNA_day5_7$day7 <- add_col



GSM3262976_RZY636_RNA_D15_1_chrM <- read_delim("GSM3262976_RZY636_RNA_D15_1-chrM.rpkm", 
                                               "\t", escape_double = FALSE, trim_ws = TRUE)

GSM3262977_RZY642_RNA_D15_2_chrM <- read_delim("GSM3262977_RZY642_RNA_D15_2-chrM.rpkm", 
                                               "\t", escape_double = FALSE, trim_ws = TRUE)



RNA_day15_merge <- merge(x = GSM3262976_RZY636_RNA_D15_1_chrM, 
                        y = GSM3262977_RZY642_RNA_D15_2_chrM,
                        by = c("Geneid"))
grep("bam", names(RNA_day15_merge))
RNA_day15_merge <- RNA_day15_merge[,c(1,7,13),] 

RNA_day5_7_15  <- merge(x = RNA_day5_7, 
                     y = RNA_day15_merge,
                     by.x = c("gene_name"),
                     by.y = c("Geneid"))


add_col  <- rowMeans(RNA_day5_7_15[,c(-2,-1)])
RNA_day5_7_15  <- RNA_day5_7[,-c(5,6)]
RNA_day5_7_15$day15 <- add_col

















GSM3262978_RZY637_RNA_D80_1_chrM <- read_delim("GSM3262978_RZY637_RNA_D80_1-chrM.rpkm", 
                                               "\t", escape_double = FALSE, trim_ws = TRUE)


GSM3262979_RZY643_RNA_D80_2_chrM <- read_delim("GSM3262979_RZY643_RNA_D80_2-chrM.rpkm", 
                                               "\t", escape_double = FALSE, trim_ws = TRUE)


RNA_day80_merge <- merge(x = GSM3262978_RZY637_RNA_D80_1_chrM, 
                         y = GSM3262979_RZY643_RNA_D80_2_chrM,
                         by = c("Geneid"))
grep("bam", names(RNA_day80_merge))
RNA_day80_merge <- RNA_day80_merge[,c(1,7,13),] 

RNA_day5_7_15_80  <- merge(x = RNA_day5_7_15, 
                        y = RNA_day80_merge,
                        by.x = c("gene_name"),
                        by.y = c("Geneid"))


add_col  <- rowMeans(RNA_day5_7_15_80[,c(-2,-1)])
RNA_day5_7_15_80  <- RNA_day5_7_15_80[,-c(6,7)]
RNA_day5_7_15_80$day80 <- add_col

  
RNA_day5_7_15_80_final   <- data.frame(row.names =RNA_day5_7_15_80$ens_id , ens_id = RNA_day5_7_15_80$ens_id, 
           gene_name = RNA_day5_7_15_80$gene_name, day5=RNA_day5_7_15_80$day5,day7=RNA_day5_7_15_80$day7,day15=RNA_day5_7_15_80$day15,
           day80=RNA_day5_7_15_80$day80)



       