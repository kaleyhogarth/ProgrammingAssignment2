## Functions to allow for cache during matric inversions

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y){ 
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolve <- function(solve) m <<- solve
  getSolve <- function() m
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}

## Function in which x is inputed, and the matrix will be inverted if it has not already been computer

cacheSolve <- function(x, ...) {
m <- x$getSolve()
if(!is.null(m)) {
  message("getting cached matrix data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setSolve(m)
m
}