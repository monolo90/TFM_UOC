
library(readr)
##gencode_v18_annotation <- read_delim("gencode.v18.annotation.gtf", 
                                         ##"\t", escape_double = FALSE, col_names = FALSE, 
                                          ##trim_ws = TRUE, skip = 5)

H3K27ac_day5_NCC <- read.table("H3K27ac.day5.tab", 
                                   sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day5_peaks_fit <- read.table("~/Escritorio/PEAKS/H3K27ac.day5_peaks_fit.bed", 
                                            sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day5_merge <- merge(x = H3K27ac_day5_peaks_fit, 
                            y = H3K27ac_day5_NCC,
                            by.x = c("V4"),
                            by.y = c("V1"))

H3K27ac_day5_format <- H3K27ac_day5_merge[,c(2,3,4,11)]
H3K27ac_day5_format$id <-rep("day5",NROW(H3K27ac_day5_format))
f <- function(x) {
  paste(x[1],trimws(as.character(x[2])),trimws(as.character(x[3])),trimws(as.character(x[5])),sep ="_")
                                              
}

vector=apply(H3K27ac_day5_format, 1, f)   
H3K27ac_day5_format$name = vector  

H3K27ac_day5_final = data.frame(chr=H3K27ac_day5_format$V1, start=H3K27ac_day5_format$V2.x,
                                end=H3K27ac_day5_format$V3.x, source=H3K27ac_day5_format$id,
                                enhid=H3K27ac_day5_format$name, acetilation= H3K27ac_day5_format$V8, 
                                row.names = H3K27ac_day5_format$name)


##gencode_v18_annotation <- read_delim("gencode.v18.annotation.gtf", 
##"\t", escape_double = FALSE, col_names = FALSE, 
##trim_ws = TRUE, skip = 5)

H3K27ac_day7_NCC <- read.table("H3K27ac.day7.tab", 
                               sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day7_peaks_fit <- read.table("~/Escritorio/PEAKS/H3K27ac.day7_peaks_fit.bed", 
                                     sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day7_merge <- merge(x = H3K27ac_day7_peaks_fit, 
                            y = H3K27ac_day7_NCC,
                            by.x = c("V4"),
                            by.y = c("V1"))

H3K27ac_day7_format <- H3K27ac_day7_merge[,c(2,3,4,11)]
H3K27ac_day7_format$id <-rep("day7",NROW(H3K27ac_day7_format))
f <- function(x) {
  paste(x[1],trimws(as.character(x[2])),trimws(as.character(x[3])),trimws(as.character(x[5])),sep ="_")
  
}

vector=apply(H3K27ac_day7_format, 1, f)   
H3K27ac_day7_format$name = vector  

H3K27ac_day7_final = data.frame(chr=H3K27ac_day7_format$V1, start=H3K27ac_day7_format$V2.x,
                                end=H3K27ac_day7_format$V3.x, source=H3K27ac_day7_format$id,
                                enhid=H3K27ac_day7_format$name, acetilation= H3K27ac_day7_format$V8, 
                                row.names = H3K27ac_day7_format$name)


##gencode_v18_annotation <- read_delim("gencode.v18.annotation.gtf", 
##"\t", escape_double = FALSE, col_names = FALSE, 
##trim_ws = TRUE, skip = 5)

H3K27ac_day15_NCC <- read.table("H3K27ac.day15.tab", 
                               sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day15_peaks_fit <- read.table("~/Escritorio/PEAKS/H3K27ac.day15_peaks_fit.bed", 
                                     sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day15_merge <- merge(x = H3K27ac_day15_peaks_fit, 
                            y = H3K27ac_day15_NCC,
                            by.x = c("V4"),
                            by.y = c("V1"))

H3K27ac_day15_format <- H3K27ac_day15_merge[,c(2,3,4,11)]
H3K27ac_day15_format$id <-rep("day15",NROW(H3K27ac_day15_format))
f <- function(x) {
  paste(x[1],trimws(as.character(x[2])),trimws(as.character(x[3])),trimws(as.character(x[5])),sep ="_")
  
}

vector=apply(H3K27ac_day15_format, 1, f)   
H3K27ac_day15_format$name = vector  

H3K27ac_day15_final = data.frame(chr=H3K27ac_day15_format$V1, start=H3K27ac_day15_format$V2.x,
                                end=H3K27ac_day15_format$V3.x, source=H3K27ac_day15_format$id,
                                enhid=H3K27ac_day15_format$name, acetilation= H3K27ac_day15_format$V8, 
                                row.names = H3K27ac_day15_format$name)



##gencode_v18_annotation <- read_delim("gencode.v18.annotation.gtf", 
##"\t", escape_double = FALSE, col_names = FALSE, 
##trim_ws = TRUE, skip = 5)

H3K27ac_day80_NCC <- read.table("H3K27ac.day80.tab", 
                               sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day80_peaks_fit <- read.table("~/Escritorio/PEAKS/H3K27ac.day80_peaks_fit.bed", 
                                     sep = "\t", header = FALSE , strip.white = FALSE)

H3K27ac_day80_merge <- merge(x = H3K27ac_day80_peaks_fit, 
                            y = H3K27ac_day80_NCC,
                            by.x = c("V4"),
                            by.y = c("V1"))

H3K27ac_day80_format <- H3K27ac_day80_merge[,c(2,3,4,11)]
H3K27ac_day80_format$id <-rep("day80",NROW(H3K27ac_day80_format))
f <- function(x) {
  paste(x[1],trimws(as.character(x[2])),trimws(as.character(x[3])),trimws(as.character(x[5])),sep ="_")
  
}

vector=apply(H3K27ac_day80_format, 1, f)   
H3K27ac_day80_format$name = vector  

H3K27ac_day80_final = data.frame(chr=H3K27ac_day80_format$V1, start=H3K27ac_day80_format$V2.x,
                                end=H3K27ac_day80_format$V3.x, source=H3K27ac_day80_format$id,
                                enhid=H3K27ac_day80_format$name, acetilation= H3K27ac_day80_format$V8, 
                                row.names = H3K27ac_day80_format$name)

H3K27ac_final = rbind(H3K27ac_day5_final,H3K27ac_day7_final,H3K27ac_day15_final,H3K27ac_day80_final)
chroms <- c(1:23, "X", "Y", "M")  
chr = paste("^chr", chroms,"$",sep = "")
H3K27ac_final = H3K27ac_final[grepl(paste(chr, collapse="|"), H3K27ac_final$chr),]
saveRDS(H3K27ac_final, "H3K27ac_day5-7-15-80.rds")

