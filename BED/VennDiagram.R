
setwd("C:/Users/monol/OneDrive/Escritorio/HIC")
D05_HIC <- read.delim("C:/Users/monol/OneDrive/Escritorio/HIC/D05_HIC.bed", header=FALSE)
D07_HIC <- read.delim("C:/Users/monol/OneDrive/Escritorio/HIC/D07_HIC.bed", header=FALSE)
D15_HIC <- read.delim("C:/Users/monol/OneDrive/Escritorio/HIC/D15_HIC.bed", header=FALSE)
D80_HIC <- read.delim("C:/Users/monol/OneDrive/Escritorio/HIC/D80_HIC.bed", header=FALSE)


overlaphic <- function(X, Y)
  {
  overfinal = data.frame()
  for (row in 1:nrow(Y)) {
    #numero+10>= 780 & numero-10<=780
    #overfinal = rbind(overfinal,X[X$V1==Y$V1[row] & X$V2+50000>=Y$V2[row]  & X$V2-50000<=Y$V2[row] 
                                 # & X$V3+50000>=Y$V3[row]  & X$V3-50000<=Y$V3[row] , ])
    overfinal = rbind(overfinal, X[X$V1==Y$V1[row] & X$V2 == Y$V2[row] & X$V3 == Y$V3[row], ])
  }
  return(overfinal)
  }
 
n12 = NROW(overlaphic(D05_HIC, D07_HIC))
n13 = NROW(overlaphic(D05_HIC, D15_HIC))
n14 = NROW(overlaphic(D05_HIC, D80_HIC))
n23 = NROW(overlaphic(D07_HIC,D15_HIC))
n24 = NROW(overlaphic(D07_HIC,D80_HIC))
n34 = NROW(overlaphic(D15_HIC,D80_HIC))

n123 = NROW(overlaphic(D05_HIC,overlaphic(D07_HIC, D15_HIC)))
n124 = NROW(overlaphic(D05_HIC,overlaphic(D07_HIC, D80_HIC)))
n134 = NROW(overlaphic(D05_HIC,overlaphic(D15_HIC, D80_HIC)))

n234 = NROW(overlaphic(D07_HIC,overlaphic(D15_HIC, D80_HIC)))

n1234 = NROW(overlaphic(D05_HIC,(overlaphic(D07_HIC,overlaphic(D15_HIC, D80_HIC)))))


library(VennDiagram)
venn.plot <-draw.quad.venn(3073, 2932, 2994, 2929, n12, n13, n14, n23, n24,
               n34, n123, n124, n134, n234, n1234,
               category = c("Día 5", "Día 7", "Día 15", "Día 80"),
               fill = c("orange", "red", "green", "blue"),
               lwd = rep(1, 4),
               lty = rep("solid", 4),
               cex = 1,
               cat.cex = 1,
               print.mode = c("raw")
)
tiff("Quad_Venn_diagram_4.tiff", units="in", width=5, height=5, res=700)
grid.draw(venn.plot)
dev.off()

