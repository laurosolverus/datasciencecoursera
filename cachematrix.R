## These functions invert matrices and access them later while reducing processing time.

## Function makeCacheMatrix return a list of functions to set and get the matrix and the inverted one.

makeCacheMatrix <- function(x = matrix()) {

## This part clears a possible Inverted matrix, and then sets the actual matrix value 
  InverseM <- NULL
  setMatrix <- function(y) { 
    x <<- y 
    InverseM <<- NULL 
  }

## This part defines a anonymous function to get the Matrix previously set.
  getMatrix <- function() x
  
## This part defines a anonymous function to invert the Matrix, and set its value.
  setInverseMatrix <- function(solve) InverseM <<- solve ##

## This part defines a anonymous function to get the inverse matrix previously inversed.
  getInverseMatrix <- function() InverseM ##
  
## The return is a list with the values of the above functions.
  list(setMatrix = setMatrix, getMatrix = getMatrix, 
       setInverseMatrix = setInverseMatrix,
       getInverseMatrix = getInverseMatrix) 

}


## Function CacheSolve access the inverted matrix cached.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
## This piece of code gets the previoully inverted matrix  
  InverseM <- x$getInverseMatrix()  
  if(!is.null(InverseM)) { 
    message("getting cached data")
    return(InverseM)
  }
  
## This piece of code previouslly set, inverse it, and set the inverted matrix values
  data <- x$getMatrix()
  InverseM <- solve(data, ...) 
  x$setInverseMatrix(InverseM) 
  
## This function returns the inverted matrix  
  InverseM

}
