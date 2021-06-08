## Cambio de formato a BED
library(genomation)
library(rtracklayer)

library(readr)

H3K27ac_day15_peaks <- read_delim("H3K27ac.day15_peaks.broadPeak","\t", escape_double = FALSE, col_names = FALSE)
H3K27ac_day15_peaks_fit = H3K27ac_day15_peaks[,-c(5:9)]
withr::with_options(c(scipen = 10), write.table(H3K27ac_day15_peaks_fit, "H3K27ac.day15_peaks_fit.bed", quote = FALSE, sep = "\t", col.names = FALSE, row.names = FALSE))
