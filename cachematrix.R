## Matrix inversion is usually a costly computation and there is performance benefit to cache
## the inverse of a matrix rather than compute it repeatedly. Below pair of functions that cache 
## the inverse of a matrix. The assumumption is matrix supplied is always invertible.


## This function creates a special "matrix" object that can cache its inverse.
## It is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {

    invertedMatrix <- NULL
    
    set <- function(y) {
        x <<- y
        invertedMatrix <<- NULL
    }
    
    get <- function() x
    
    setInverse <- function(inverseMatrix) invertedMatrix <<- inverseMatrix
    
    getInverse <- function() invertedMatrix
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    
    m <- x$getInverse()
    
    ## check inverse of matrix is available
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    newMatrix <- x$get()
    
    m <- solve(newMatrix, ...)
    
    x$setInverse(m)
    
    ## Return a matrix that is the inverse of 'x'
    m
        
}
