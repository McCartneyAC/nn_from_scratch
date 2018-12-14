# Neural Nets From Scratch

think <- function(inputs, network){
  sigmoid(dot(inputs, network))
}

train<-function(train_set_in, train_set_out, iterations){
  synap_weights <- runif(ncol(train_set_in),-1,1)
  for (i in 1:iterations){
    output <- sigmoid(dot(train_set_in, synap_weights))
    error  <- train_set_out - output
    adjustment <- dot(t(train_set_in), error*sigmoid_derivative(output))
    synap_weights <- synap_weights + adjustment
  }
  return(synap_weights)
}




# Begin ------


# The training set. We have 4 examples, each consisting of 
# 3 input values and 1 output value.
# 
training_set_inputs <- t(as.matrix(cbind(c(0, 0, 1),
                                       c(1, 1, 1),
                                       c(1, 0, 1),
                                       c(0, 1, 1))))
training_set_outputs <-c(0, 1, 1, 0)
# Train the neural network using a training set.
# Do it 10,000 times and make small adjustments each time.
net <- train(training_set_inputs, training_set_outputs, 10000)

print("New synaptic weights after training: ")
net

# Test the neural network with a new situation.
print("Considering new situation [1, 0, 0] -> ?: ")
think(c(1,0,0),net)
think(c(0,1,0),net)
think(c(1,0,1),net)
think(c(0,0,0),net)
