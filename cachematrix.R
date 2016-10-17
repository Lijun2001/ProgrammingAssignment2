## The code below would be able to cache the time-consuming computations of the matrix inversion.



## The function `makeCacheMatrix` creates a special "matrix", which is
## a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the matrix inversion
## 4.  get the value of the matrix inversion


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<-solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}



## The following function, "cacheSolve", calculates the inverse of the special "matrix"
## created with the function "makeCacheMatrix". It first checks to see if the
## inverse of the special "matrix" has already been calculated. If so, it `get`s 
## the inverse of the special "matrix"  from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value of the matrix
## inversion in the cache via the `setinverse` function.




cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  
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
