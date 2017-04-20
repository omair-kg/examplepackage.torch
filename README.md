Torch implementation of Tukey's loss function as presented in the paper 'Robust Optimization for Deep Regression' by Belagiannis et al.
Implementation adapted from the [MatConvNet](http://www.vlfeat.org/matconvnet/) implementation by [Belagiannis](https://github.com/bazilas/matconvnet-deepReg).
The loss function is located in the directory 'newLoss'. Currently it doesn't work with CUDA because it uses the median function for which there is no cuda implementation in torch. 

To use the loss function put newLoss folder in your project

In your code
require 'newLoss.TukeyLoss'
criterion = nn.TukeyLoss()

-------------------------------------------------------
To do
- Convert loss into a package into a package.
- Upload unit test script.

