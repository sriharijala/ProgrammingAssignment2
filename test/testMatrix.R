## This is a a test script to test the cacheMatrix. 
## It can be run as backgound R commnad with output to redirected to testOutput.log
##
## R CMD BATCH testMatrix.R

source("../cacheMatrix.R")

newMatrix <-makeCacheMatrix(matrix(c(1,2,3,0,1,4,5,6,0),3,3))

newMatrix$get()

newMatrix$getInverse()

cacheSolve(newMatrix)

cacheSolve(newMatrix)

newMatrix$getInverse()

newMatrix$set(matrix(c(1,0,5,2,1,6,3,4,0),3,3))

newMatrix$get()

newMatrix$getInverse()

cacheSolve(newMatrix)

cacheSolve(newMatrix)

newMatrix$getInverse()


