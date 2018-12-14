sigmoid<-function(x){
  1/(1+exp(-x))
}

sigmoid_derivative<-function(x){
  x*(1-x)
}

dot <- function(x,y){
# code transferability strengthened by re-casting infix notation:
  x %*% y
}
