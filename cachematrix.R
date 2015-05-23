## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix function has a variable tha is initialized to "NULL" and 4 functions(set, get, setmatrix and getinv) 
## ***The "set" function is a function that changes the value of the argument passed in the main function and 
## overwrites the x variable with the value passed to this function. This function also assigns the "Null" value again 
## to the mtrx variable.
## ***The "get" function retrieves the value that was passed as an argmument in the main function, in this case
## the matrix.
## ***The "setmatrix" function gets a new argument(matrix) when it is called, calculates the inverse of the matrix
## and assigns its value to the mtrx variable.
##***The "getinv" functions returns the value of the inverse matrix.
## The list function list all the functions within the main function.

makeCacheMatrix <- function(x = matrix()) {
        mtrx <- NULL
        set <- function(y) {
                x <<- y
                mtrx <<- NULL
        }
        get <- function() x
        setmatrix <- function(matrix) mtrx <<- solve(matrix)
        getinv<- function() mtrx
        
        list(set = set, get = get,
             setmatrix = setmatrix,
             getinv = getinv)
}



## Write a short comment describing this function
## The function "cacheSolve" calls the function getinv() from the makeCacheMatrix function and checks to see
## if the value returned in this case the inverse of the matrix is not null.
## if it is not null, then it returns a message and the cached inverse matrix.
## if the m variable is null, then the cacheSolve function gets the original value of the matrix using the 
## get() function, then it calcualtes the inverse of the matrix and returns the value to the calling environment.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if (!is.null(m)) {
                message("getting cached inverse matrix")
                return(m)
        }
        mdata <- x$get()
        m <- solve(mdata)
        m
      
}



