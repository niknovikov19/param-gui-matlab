# param-gui-matlab
An easy way to build a GUI window for setting parameter values and running your Matlab code with these parameters

## Introduction
In certain situations, you may have a script or function that performs an algorithm with several numeric parameters, and you want to explore its behavior with various parameter combinations. Manually changing parameter values and re-running the code could quickly become an annoying. Furthermore, you could find several combinations of parameter values that yield important results, which prompts a question of how to store these values.

This tool provides an easy way to create a GUI window that contains input fields for the required parameters and allows to:
- modify parameter values
- save / load combinations of the parameter values
- run an arbitrary function, passing the parameter values from the GUI to this function

## Installation 
Simply download the code and add it to the Matlab path.

## Usage
### 1. Original code
Consider that you have a piece of code that plots a quadratic parabola:
[Image1]

The parameters are:
- coefficients: a0, a1, a2
- line color components: R, G, B
- line style

Now you want to create GUI for setting these parameters and call the parabola-plotting code from this GUI.

