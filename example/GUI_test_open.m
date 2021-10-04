% An example of GUI-creating script
%
% This GUI contains parameters for plotting a simple quadratic parabola:
% a0, a1, a2 - coefficients
% R, G, B - color
% line_type - style of the plot

% Number of GUI elements in a row / column
num_GUI_elem_x = 3;
num_GUI_elem_y = 3;

% Description of the GUI elements:
% {name, mutiplier, initial value, increment}
% or
% {LIST:name, {value1, value2, ...}}
par_descs = {...
	{'a0', 1, 4, 0.1},...						% First column
	{'a1', 1, 0, 0.1},...
	{'a2', 1, 0, 0.1},...
	{'R', 1/255, 0, 10},...						% Second column
	{'G', 1/255, 0, 10},...
	{'B', 1/255, 255, 10},...
	{'LIST:line_type', {'Solid', 'Dashed'}}...	% Third column
};

% Function to run (with the parameter values taken from the GUI)
inner_proc = @GUI_test_proc;

% Folder to store parameters
% Here it is set to:
% <path to this script>/GUI_PARAMS/<name of this script>
% But you can set any path you want
dirpath_par = fileparts(mfilename('fullpath'));
dirpath_par = fullfile(dirpath_par, 'GUI_PARAMS', mfilename);
if ~exist(dirpath_par, 'dir')
	mkdir(dirpath_par);
end

% 1 - automatically run inner_proc after each change of parameters
% 0 - run inner_proc on the "Run" button click only
% Use 1 for fast-running functions to see the result of changing
% parameter values in the GUI on-the-fly
% Use 0 for long-running functions, so you can set the required combination
% of parameter values and then press the "Run" button
need_autorun = 1;

% Name of the GUI window (you can change it)
win_name = mfilename;

% Create GUI window
create_param_GUI(par_descs, inner_proc, num_GUI_elem_x, num_GUI_elem_y,...
	dirpath_par, need_autorun, win_name);