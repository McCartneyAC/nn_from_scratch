# NNET multilayer 
# # adapted from : https://github.com/miloharper/multi-layer-neural-network/blob/master/main.py#L29
# 




synaptic_weights <- function(training_set_inputs, num_neurons) {
  matrix(
    runif(n = ncol(training_set_inputs) * num_neurons,-1, 1),
    nrow = ncol(training_set_inputs),
    ncol = num_neurons
  )
}




train<-function(training_set_inputs, training_set_outputs, iterations, 
                L1_neurons = 4, L2_neurons = 1){
  # function to create architecture
  neuron_layer<-function(num_neurons, inputs_per_neuron) {
    matrix(
      runif(n = inputs_per_neuron * num_neurons, -1, 1),
      nrow = inputs_per_neuron,
      ncol = num_neurons
    )
  }
  
  # create layers / synaptic weights
  L1synap_weights  <- neuron_layer(num_neurons = L1_neurons, 
                     inputs_per_neuron = ncol(training_set_inputs))
  L2synap_weights  <- neuron_layer(num_neurons = L2_neurons, 
                      inputs_per_neuron = L1_neurons)
  net <- c(L1synap_weights,L2synap_weights)

  for (i in 1:iterations) {
    # Pass the training set through our neural network
    output_from_L1 <- sigmoid(dot(training_set_inputs, L1synap_weights))
    output_from_L2 <- sigmoid(dot(output_from_L1, L2synap_weights))
    
    # Calculate the error for layer 2 (The difference between the desired output
    # and the predicted output).
    L2_error <- training_set_outputs - output_from_L2
    L2_delta <- L2_error * sigmoid_derivative(output_from_L2)
    
    # Calculate the error for layer 1 (By looking at the weights in layer 1,
    # we can determine by how much layer 1 contributed to the error in layer 2).
    L1_error <- dot(L2_delta, t(L2_synap_weights))
    L1_delta <- L1_error *sigmoid_derivative(output_from_L1)
    
    # Calculate how much to adjust the weights by
    L1_adjustment <- dot(t(training_set_inputs), L1_delta)
    L2_adjustment <- dot(t(output_from_L2), L2_delta)
    
    # Adjust the weights.
    L2synap_weights <- L2synap_weights + L2_adjustment
    L1synap_weights <- L1synap_weights + L1_adjustment
  }
  
  return(net) # return what exactly? The final synaptic weights but in what form? 
}

think<- function(training_set_inputs, net) {
  output_from_L1 <- sigmoid(dot(training_set_inputs, L1synap_weights))
  output_from_L2 <- sigmoid(dot(output_from_L1, L2synap_weights))
  return(output_from_L1, output_from_L2 )
}

print_weights<-function(){}


## Run Ex in Sections: -------------------------------------------------
L1_neurons = 4
L2_neurons = 1

# function to create architecture
neuron_layer<-function(num_neurons, inputs_per_neuron) {
  matrix(
    runif(n = inputs_per_neuron * num_neurons, -1, 1),
    nrow = inputs_per_neuron,
    ncol = num_neurons
  )
}

# create layers / synaptic weights
L1synap_weights  <- neuron_layer(num_neurons = L1_neurons, 
                                 inputs_per_neuron = ncol(training_set_inputs))
L2synap_weights  <- neuron_layer(num_neurons = L2_neurons, 
                                 inputs_per_neuron = L1_neurons)
net <- c(L1synap_weights, L2synap_weights)

# for (i in 1:iterations) {
# Pass the training set through our neural network
output_from_L1 <- sigmoid(dot(training_set_inputs, L1synap_weights))
output_from_L2 <- sigmoid(dot(output_from_L1, L2synap_weights))

# Calculate the error for layer 2 (The difference between the desired output
# and the predicted output).
L2_error <- training_set_outputs - output_from_L2
L2_delta <- L2_error * sigmoid_derivative(output_from_L2)

# Calculate the error for layer 1 (By looking at the weights in layer 1,
# we can determine by how much layer 1 contributed to the error in layer 2).
L1_error <- dot(L2_delta, t(L2synap_weights))
L1_delta <- L1_error *sigmoid_derivative(output_from_L1)

# Calculate how much to adjust the weights by
L1_adjustment <- dot(t(training_set_inputs), L1_delta)
L2_adjustment <- dot(t(output_from_L2), L2_delta)

# Adjust the weights.
L2synap_weights <- L2synap_weights + L2_adjustment
# ERROR HERE:
# Error in L2synap_weights + L2_adjustment : non-conformable arrays
# may need to transpose? 
L1synap_weights <- L1synap_weights + L1_adjustment
