throughput <- function (data) {
    tx <- data.frame(count=seq(1, length(data$end)), seconds=floor(data$end / 1000))    
    return(aggregate(count ~ seconds, tx, length))
}

tpccThroughput <- function (name) {
    # Load data
    baseline <- read.csv(file="baseline-tp/static-baseline.csv", sep=",", head=TRUE)
    data <- read.csv(file=paste(name, ".csv", sep=""), sep=",", head=TRUE)
    endRange <- range(data$end)

    # Calculate throughputs for non-elastic Tell and our implementation
    baseTp <- throughput(baseline)
    tp <- throughput(data)
    
    # Plot results
    pdf(paste("out/", name, "-throughput", ".pdf", sep=""))

    plot(baseTp$seconds, baseTp$count, type="s", axes=FALSE, ann=FALSE)
    lines(tp$seconds, tp$count, type="s", col="blue", ann=FALSE)

    # Time indicator
    # abline(v=34, lty=2, lwd=3.0)

    axis(1, at=10*0:length(data$end))
    axis(2, las=1, at=100*0:endRange[2])

    title(xlab = "Time in Seconds")
    title(ylab = "Transactions / Second")

    legend(1, 200, c("Non-Elastic Tell","Our Implementation"), cex=1.3, col=c("black","blue"), lty=1:1);

    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
Map(tpccThroughput, args)