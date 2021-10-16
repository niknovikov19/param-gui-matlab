# param-gui-matlab
An easy way to create a Matlab GUI window for setting parameter values and running your code with these parameters

## Introduction

In certain situations, you may have a script or function that performs an algorithm with several numeric parameters, and you want to explore its behavior with various parameter combinations. Manually changing parameter values and re-running the code could quickly become an annoying. Furthermore, you could find several combinations of parameter values that yield important results, which prompts a question of how to store these values.

This tool provides an easy way to create a GUI window that contains input fields for the required parameters and allows to:
- modify parameter values
- save / load combinations of the parameter values
- run an arbitrary function, passing the parameter values from the GUI to this function

## Installation 

Simply download the code and add it to the Matlab path.

## Attaching GUI to your code

Consider that you have a piece of code that plots a quadratic parabola:

```
% Coefficients
a0 = 1;
a1 = 2;
a2 = -1;

% Color and style
R = 255;
G = 0;
B = 0;
line_type = 'Solid';	

if strcmp(line_type, 'Solid')
  style = '-';
elseif strcmp(line_type, 'Dashed')
  style = '--';
end

x = linspace(-3, 3, 500);       % uniformly spreaded x-values
y = a0 + a1 * x + a2 * x.^2;    % y-values are given by the quadratic formula

figure(100);
plot(x, y, style, 'Color', [R,G,B]);
```

The parameters are:
- coefficients: *a0, a1, a2*
- line color components: *R, G, B*
- line type (solid or dashed): *line_type*

Now you want to create GUI for setting these parameters and call the parabola-plotting code from this GUI.

### 1. Create the function that will be called from the GUI

Wrap your code as follows:

```
function GUI_test_proc(params)

  % Get parameters passed from the GUI and create local variables with the same names and values
  unpack_params(params);
  
  if strcmp(line_type, 'Solid')
    style = '-';
  elseif strcmp(line_type, 'Dashed')
    style = '--';
  end

  x = linspace(-3, 3, 500);       % uniformly spreaded x-values
  y = a0 + a1 * x + a2 * x.^2;    % y-values are given by the quadratic formula

  figure(100);
  plot(x, y, style, 'Color', [R,G,B]);

end
```

The changes you should make are minimal:
- Provide the appropriate function header
- Replace the parameter declaration by *unpack_params(params)*

The function that wraps your code will be called from the GUI (see the next step). Parameter values will be passed via the argument *params*.
The call of *unpack_params(params)* will create parameter variables (with the appropriate names and values) in the local context, as they were in the original code.

See the code in: */example/GUI_test_proc.m*

**NOTE: The mechanism used in unpack_params() is incompatible with nested functions. So you should either avoid nested functions within *GUI_test_proc()* or unpack the parameters manually inside the body of _GUI_test_proc()_.**


### 2. Create the function or script that will open the GUI window

See the full code in: */example/GUI_test_open.m*

* **Define GUI elemets that correspond to the required parameters**

The elements will be organized into a 2-d matrix.
First, you should define the number of GUI elements by both axes:

```
num_GUI_elem_x = 3;
num_GUI_elem_y = 3;
```

Next, define the elements themselves:

```
par_descs = {...
	{'a0', 1, 4, 0.1},...						            % First column
	{'a1', 1, 0, 0.1},...
	{'a2', 1, 0, 0.1},...
	{'R', 1/255, 0, 10},...						          % Second column
	{'G', 1/255, 0, 10},...
	{'B', 1/255, 255, 10},...
	{'LIST:line_type', {'Solid', 'Dashed'}}...	% Third column
};
```

Currently there are two types of parameters that you can define:
- Numeric
- String constants

**Numeric parameters** are defined as follows:
'''
{'R', 1/255, 0, 10}
'''

A numeric parameter description consists of four elements:
- Parameter name: *'R'*
- Multiplier: *1/255*
- Initial value: *0*
- Increase / decrease step: *10*

Each time you press up / down button near the parameter field in the GUI, its value in this field will increase / decrease by 10.
The parameter value in the field will be multiplied by 1/255 before passing to the *GUI_test_proc()* function.

**String constant parameters** are defined as follows:
'''
{'LIST:line_type', {'Solid', 'Dashed'}}
'''



#### - Provide the name of the function to be called ####

It is the name of the function you have created at the step 1.

```
inner_proc = @GUI_test_proc;
```

* **Set the path of the folder to save and load parameter values**

```
dirpath_par = fileparts(mfilename('fullpath'));
dirpath_par = fullfile(dirpath_par, 'GUI_PARAMS', mfilename);
if ~exist(dirpath_par, 'dir')
	mkdir(dirpath_par);
end
```

* **Set whether the function should be called automatically after any parameter change**

```
need_autorun = 1;
```

* **Create the GUI window**

```
% Name of the GUI window (you can change it)
win_name = mfilename;

% Create GUI window
create_param_GUI(par_descs, inner_proc, num_GUI_elem_x, num_GUI_elem_y,...
	dirpath_par, need_autorun, win_name);
```
