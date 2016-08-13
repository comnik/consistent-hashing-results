
tpccThroughput <- function(name) {
    xMax <- 10
    yMax <- 350000

    data <- read.csv(file=paste(name, ".csv", sep=""), sep=",", head=TRUE)

    png(paste(name, "-throughput", ".png", sep=""))

    endRange <- range(data$end)

    tx <- data.frame(count=seq(1, length(data$end)), seconds=floor(data$end / 1000))
    txPerSecond <- aggregate(count ~ seconds, tx, length)

    plot(txPerSecond$seconds, txPerSecond$count, type="s", axes=FALSE, ann=FALSE)

    # Node addition
    # abline(v=24, lty=2)

    # Node removal
    # abline(v=11, lty=2)

    axis(1, at=10*0:length(data$end))
    axis(2, las=1, at=100*0:endRange[2])

    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
Map(tpccThroughput, args)