inputName <- function(name, numVnodes) {
    paste(name, "-", numVnodes, "vnodes.csv", sep="")
}

outputName <- function(name, numVnodes) {
    paste("plots/", name, "-", numVnodes, "vnodes.png", sep="")
}

generatePlots <- function(numVnodes) {
    xMax <- 10
    yMax <- 350000

    modulo  <- read.csv(file=inputName("modulo", numVnodes),    sep=",", head=FALSE)
    stdhash <- read.csv(file=inputName("stdhash", numVnodes),   sep=",", head=FALSE)
    murmur3 <- read.csv(file=inputName("murmur3", numVnodes),   sep=",", head=FALSE)

    png(outputName("modulo", numVnodes))
    Nodes <- modulo$V1
    hist(   Nodes, 
            breaks = c(0,1,2,3,4,5,6,7,8,9,10), 
            xlim = c(0, xMax), 
            ylim = c(0, yMax),
            main = ""   )
    dev.off()

    png(outputName("stdhash", numVnodes))
    Nodes <- stdhash$V1
    hist(   Nodes, 
            breaks = c(0,1,2,3,4,5,6,7,8,9,10), 
            xlim = c(0, xMax), 
            ylim = c(0, yMax),
            main = "")
    dev.off()

    png(outputName("murmur3", numVnodes))
    Nodes <- murmur3$V1
    hist(   Nodes, 
            breaks = c(0,1,2,3,4,5,6,7,8,9,10), 
            xlim = c(0, xMax), 
            ylim = c(0, yMax),
            main = "")
    dev.off()
}

args <- commandArgs(trailingOnly = TRUE)
vnodeNums <- Map(strtoi, args)
Map(generatePlots, vnodeNums)