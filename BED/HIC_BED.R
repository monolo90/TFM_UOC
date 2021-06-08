

D05_HIC <- read_delim("D05_HIC.bed", "\t", 
                           escape_double = FALSE, col_names = c("chr", "start", "end"), 
                            trim_ws = TRUE)

D07_HIC <- read_delim("D07_HIC.bed", "\t", 
                           escape_double = FALSE, col_names =c("chr", "start", "end"), 
                            trim_ws = TRUE)
D15_HIC <- read_delim("D15_HIC.bed", "\t", 
                      escape_double = FALSE, col_names =c("chr", "start", "end"), 
                      trim_ws = TRUE)

D80_HIC <- read_delim("D80_HIC.bed", "\t", 
                      escape_double = FALSE, col_names =c("chr", "start", "end"), 
                      trim_ws = TRUE)

toGRanges("D80_HIC.bed")
D05_HIC$tamaño_TAD = D05_HIC$end-D05_HIC$start
D07_HIC$tamaño_TAD = D07_HIC$end-D07_HIC$start
D15_HIC$tamaño_TAD = D15_HIC$end-D15_HIC$start
D80_HIC$tamaño_TAD = D80_HIC$end-D80_HIC$start

D05_HIC$dia = replicate(NROW(D05_HIC), "Día 5")
D07_HIC$dia = replicate(NROW(D07_HIC), "Día 7")
D15_HIC$dia = replicate(NROW(D15_HIC), "Día 15")
D80_HIC$dia = replicate(NROW(D80_HIC), "Día 80")

HI_C=rbind(D05_HIC,D07_HIC,D15_HIC,D80_HIC)
HI_C$day=factor(HI_C$dia,levels = c("Día 5","Día 7","Día 15","Día 80"))

lista = list(D05_HIC$tamaño_TAD,D07_HIC$tamaño_TAD)
library(ggplot2)
ggplot(stack(df), aes(x = ind, y = values)) +geom_boxplot()



boxplot(tamaño_TAD~day,
        data=HI_C,
        main="Diferencia de tamaño de los TADs",
        xlab="Estadios embrionarios",
        ylab="Tamaño de los TADs",
        col=c("orange","blue","red","yellow"),
        border="black"
)


D05_HIC = toGRanges("D05_HIC.bed")
D07_HIC = toGRanges("D07_HIC.bed")
D15_HIC = toGRanges("D15_HIC.bed")
D80_HIC = toGRanges("D80_HIC.bed")

library(ChIPpeakAnno)
peaks1 <- GRanges("chr1", IRanges(seq(1, 100, 5), width=2), "+")
peaks2 <- GRanges("chr1", IRanges(seq(2, 20, 3), width=2), "+")
peaks3 <- GRanges("chr1", IRanges(seq(10, 50, 4), width=2), "+")
res <- makeVennDiagram(Peaks=list(D05_HIC, D07_HIC, D15_HIC, D80_HIC), NameOfPeaks=c("Día 5", "Día 7", "Día 15","Día 80"), type="equal",plot = T)

v <- venn_cnt2venn(res$vennCounts)


olaps  <- ssvOverlapIntervalSets(list(D05_HIC, D07_HIC, D15_HIC, D80_HIC),type="equal")


library(VennDiagram)

draw.quad.venn(length(D05_HIC),length(D07_HIC),length(D15_HIC), length(D80_HIC),
               length(findOverlaps(D05_HIC,D07_HIC, type = "equal")),length(findOverlaps(D05_HIC,D15_HIC, type = "equal")), length(findOverlaps(D05_HIC,D80_HIC, type = "equal")),
               length(findOverlaps(D07_HIC,D15_HIC, type = "equal")),length(findOverlaps(D07_HIC,D80_HIC, type = "equal")),
               length(findOverlaps(D15_HIC,D80_HIC, type = "equal")),length(Reduce(function(x, y) subsetByOverlaps(x,y, type = "equal"), 
                                                                                   list(D05_HIC,D07_HIC,D15_HIC))),
               length(Reduce(function(x, y) subsetByOverlaps(x,y, type = "equal"), 
                             list(D05_HIC,D07_HIC,D80_HIC))),
               length(Reduce(function(x, y) subsetByOverlaps(x,y, type = "equal"), 
                             list(D05_HIC,D15_HIC,D80_HIC))),
               length(Reduce(function(x, y) subsetByOverlaps(x,y, type = "equal"), 
                             list(D07_HIC,D15_HIC,D80_HIC))),
               length(Reduce(function(x, y) subsetByOverlaps(x,y, type = "equal"), 
                             list(D05_HIC,D07_HIC,D15_HIC,D80_HIC))),
               category = c("Día 5", "Día 7", "Día 15","Día 80"),
               fill = c("orange", "red", "green", "blue"))

subsetByOverlaps

length(Reduce(function(x, y) subsetByOverlaps(x,y, type = "equal"), 
       list(D05_HIC,D07_HIC,D15_HIC)))
######
