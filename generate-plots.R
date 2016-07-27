inputName <- function(name, numVnodes) {
    paste(name, "-", numVnodes, "vnodes.csv", sep="")
}

outputName <- function(name, numVnodes) {
    paste("plots/", name, "-", numVnodes, "vnodes.png", sep="")
}

generatePlots <- function(numKeys, numVnodes) {
    modulo  <- read.csv(file=inputName("modulo", numVnodes),    sep=",", head=FALSE)
    md5     <- read.csv(file=inputName("md5", numVnodes),       sep=",", head=FALSE)
    murmur3 <- read.csv(file=inputName("murmur3", numVnodes),   sep=",", head=FALSE)

    png(outputName("modulo", numVnodes))
    hist(modulo$V1, breaks=10)
    dev.off()

    png(outputName("md5", numVnodes))
    hist(md5$V1, breaks=10)
    dev.off()

    png(outputName("murmur3", numVnodes))
    hist(murmur3$V1, breaks=c(0,1,2,3,4,5,6,7,8,9))
    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
generatePlots(strtoi(args[1]), strtoi(args[2]))