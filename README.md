# nn_from_scratch
🧠 🕸️ Building neural net training functions from scratch in R, based on @miloharper

I was really inspired by Milo Harper's [Neural Net in 9 lines of Code](https://medium.com/technology-invention-and-more/how-to-build-a-simple-neural-network-in-9-lines-of-python-code-cc8f23647ca1) and I wanted to fiddle with some of the code to see what I could learn. 

However, it was written in Python! A language I don't speak! So as a tool to both learn about neural nets under the hood and to learn to read Python better, I endeavored to trans-code his python neural net from scratch into an R neural net. This is available as `single_neuron.R`. 

I am now working on re-writing his follow up code to do 2-layer neural networks from Python to R, with the ultimate goal of making generalizable training and predicting functions (and perhaps a plotting function?) that could be assembled into a home-grown neural net R package. 

This is not intended to take the place of real R packages for machine learning such as `caret`, `nnet`, and `NeuralNet`. Those are for actual use. This is intended to be an educational project to stretch skills in R programming, linear algebra, package development, etc. Much of the struggle comes from figuring out how to translate Milo's well-written OOP code into an R functional paradigm.

Submit any issues you see or pull requests you think are good. 
