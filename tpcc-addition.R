throughput <- function (data) {
    tx <- data.frame(count=seq(1, length(data$end)), seconds=floor(data$end / 1000))    
    return(aggregate(count ~ seconds, tx, length))
}

tpccAddition <- function (name) {
    # Load data
    data <- read.csv(file=paste(name, ".csv", sep=""), sep=",", head=TRUE)
    endRange <- range(data$end)

    # Calculate throughputs for non-elastic Tell and our implementation
    tp <- throughput(data)
    
    # Plot results
    pdf(paste(name, "-throughput", ".pdf", sep=""))

    plot(tp$seconds, tp$count, type="s", col="blue", axes=FALSE, ann=FALSE)

    # Node addition
    # abline(v=24, lty=2, lwd=3.0)

    # Node removal
    abline(v=11, lty=2, lwd=3.0)

    axis(1, at=10*0:length(data$end))
    axis(2, las=1, at=100*0:endRange[2])

    title(xlab = "Time in Seconds")
    title(ylab = "Transactions / Second")

    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
Map(tpccAddition, args)