## Our functions makeCacheMatrix and cacheSolve will be used to cache the
## the potentially time consuming calculation of the inverse  of a matrix. 
## Our functions will cache and retrieve the matrix object

## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then the cacheSolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

## Example test.....let's see if it all works

example0 <- rbind(c(1, -1/4), c(-1/4, 1))

example1 <- makeCacheMatrix(example0)

cacheSolve(example1)
example0

## Not bad! Thank you for looking at my code!