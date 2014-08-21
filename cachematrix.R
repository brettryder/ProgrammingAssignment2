## Create a function to cache a matrix inverse 

## This function creates a list containing a function to set the value
## of the matrix,get the value of the matrix, set the value of the inverse 
## and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        get<-function() x
        setinv<-function(solve) m<<- solve
        getinv<- function() m
        list(get=get,setinv=setinv,getinv=getinv)
}


## Function to calculate the inverse of the matrix after first checking
## that the inverse has already been calculated in which case it uses
## the cached value

cacheSolve <- function(x, ...) {
        m<-x$getinv()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data<-x$get()
        m<-solve(data)
        x$setinv(m)
        m
}
