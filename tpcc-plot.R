
tpccPlot <- function(name) {
    xMax <- 10
    yMax <- 350000

    data <- read.csv(file=paste(name, ".csv", sep=""), sep=",", head=TRUE)

    png(paste(name, ".png", sep=""))
    
    dt <- (data$end - data$start)
    dt <- dt[seq(2, length(dt))]
    # dt <- dt[seq(2, 17303, 1)]
    g_range <- range(0, dt)

    plot(dt, type="o", axes=FALSE, ann=FALSE, ylim=g_range)

    axis(1, at=1000*0:length(dt))
    axis(2, las=1, at=50*0:g_range[2])

    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
Map(tpccPlot, args)