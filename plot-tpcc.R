
tpccPlot <- function(name) {
    data <- read.csv(file=paste(name, ".csv", sep=""), sep=",", head=TRUE)

    pdf(paste("out/", name, "-latency", ".pdf", sep=""))
    
    dt <- (data$end - data$start)
    dt <- dt[seq(2, length(dt), length.out=50000)]
    g_range <- range(0, dt)

    plot(dt, type="p", axes=FALSE, ann=FALSE, ylim=g_range)

    axis(2, las=1, at=0:g_range[2])

    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
Map(tpccPlot, args)