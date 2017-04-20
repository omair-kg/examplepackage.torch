Torch implementation of Tukey's loss function as presented in the paper 'Robust Optimization for Deep Regression' by Belagiannis et al.
Implementation adapted from the MatConvNet implementation by Belagiannis.
The loss function is located in the directory 'newLoss'. Currently it doesn't work with CUDA because it uses the median function for which there is no cuda implementation in torch. 

-------------------------------------------------------
To do
- Convert it into a package.
- Upload unit test script.

You can install the package by opening a terminal, changing directory into the folder and typing:

luarocks make
