function GUI_test_proc(params)

	% Get parameters passed from the GUI and create local variables with the same names and values
	unpack_params(params);

	% Prepare the data to plot
	x = linspace(-3, 3, 500);       % uniformly spreaded x-values
	y = a0 + a1 * x + a2 * x.^2;    % y-values are given by the quadratic formula

	% Line style
	if strcmp(line_type, 'Solid')
		style = '-';
	elseif strcmp(line_type, 'Dashed')
		style = '--';
	end

	% Plot
	figure(100);
	plot(x, y, style, 'Color', [R,G,B]);

end
