x <-30
y<-30

save(x, file="results/02_plot/x.Rdata")
png(file="results/02_plot/plota.png")
plot(x,y)
dev.off()
