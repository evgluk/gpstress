# Setup -----------
library(ggplot2)
library(dplyr)
library(data.table)
#library(ggbiplot)
library(lattice)
library(corrplot)
library(RColorBrewer)

fig3a = function(data){
  data1 = dplyr::select(data,c(ls1,ls2,ls3,lh1,lh2,lh3,pss,bepsi,lcu,ms,ts))
  df = na.omit(data1)
  #df = data
  Mc <- cor(df)
  resc <- cor.mtest(df, conf.level = .95)
  #pdf(file = "../../figs/subj_figs/fig3a.pdf")
  p = corrplot(Mc, method = "color", type = "upper", p.mat = resc$p, 
               sig.level = 0.05, col = brewer.pal(n=10, name = "PuOr"), tl.col = "purple") 
  #dev.off()
  return(p)
}