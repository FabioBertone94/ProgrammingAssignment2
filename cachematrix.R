
# I define a empty variable of type matrix to be used later

# I define a nested function called set to be used to
# initialize the matrix (at this step the inverse is not yet
# computed so it's initialized with NULL value)
# Since potentially the matrix, due to its dimension, and the 
# inverse, due to it's computational complexity, are 'heavy'
# I state that they should be cached

# get and getinv simply return the matrix and its
# inverse respectively

# setinv is the function that will be called to compute the
# inverse of the matrix: here we state again that this result
# shoul be cached

# finally a list with all the 4 functions is returned

makeCacheMatrix <- function(x = matrix()) {
  x <- NULL
  set <- funtion(y){
    x <<- y
    i <<- NULL
  }
  get <- function(){x}
  setinv <- function(solve) i <<- solve
  getinv <- function(){i}
  list(set=set, get=get,
       setinv = setinv,
       getinv = getinv)
}

# Here I first check if there are in the cache
# the value of interest relative to x
# - if yes I get it from the cache and simply return them
#   without the need for any computation
# - otherwise I have to compute again the inverse
#   using the solve() function

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinv(i)
  i
}
