tpccQuantiles <- function (name) {
    data <- read.csv(file=paste(name, ".csv", sep=""), sep=",", head=TRUE)

    dt <- (data$end - data$start)

    quantiles <- quantile(dt, probs = c(0.99, 0.95, 0.75, 0.25, 0.05, 0.01))
}

args <- commandArgs(trailingOnly = TRUE)
Map(tpccQuantiles, args)
