function GUI_par_to_text(fid, params)
% Load a file with GUI parameters and print them as a text
% fid - output file handle, if unspecified - print to the console

init_var('fid', 'NaN');

if ~exist('params', 'var')
	
	% Get input path from a dialog
	dirpath_load_base = 'E:\WORK\MODEL\results\GUI_PARAMS';
	[fname, dirpath] = uigetfile('*.mat', 'Load', dirpath_load_base);

	% Load
	Q = load(fullfile(dirpath,fname));
	params = Q.params;
	
end

%{
for n = 1 : length(params)
	
	if isnan(fid)
		fprintf('%s = %f;\n', params(n).par_name, params(n).par_val);
	else
		fprintf(fid, '%s = %f;\n', params(n).par_name, params(n).par_val);
	end
	
end
%}

fldnames = fieldnames(params);

for n = 1 : length(fldnames)
	
	if isnan(fid)
		fprintf('%s = %f;\n', fldnames{n}, params.(fldnames{n}));
	else
		fprintf(fid, '%s = %f;\n', fldnames{n}, params.(fldnames{n}));
	end
	
end

end

