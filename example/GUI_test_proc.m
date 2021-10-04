function GUI_test_proc(params)
% An example function called from GUI
%
% This function plots a simple quadratic parabola
% params - a structure collected from GUI elements, with the fields:
% a0, a1, a2 - coefficients
% R, G, B - color
% line_type - style of the plot

% Get parameters passed from the GUI and create local variables
% with the same names and values
unpack_params(params);

x = linspace(-3,3,500);
y = a0 + a1 * x + a2 * x.^2;

if strcmp(line_type, 'Solid')
	style = '-';
elseif strcmp(line_type, 'Dashed')	
	style = '--';
else
	fprintf('Unknown style\n')
	style = '-';
end
	
figure(100);
plot(x, y, style, 'Color', [R,G,B]);

end
