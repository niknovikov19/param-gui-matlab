function unpack_params(params, par_names)
% Read structure with parameter (name-value) pairs and create local variables in the caller scope

% if ~exist('par_names', 'var')
% 	par_names = {params.par_name};
% end

for n = 1 : length(params)
	
	par_name = params(n).par_name;
	par_val = params(n).par_val;
	
% 	if ~ismember(par_name, par_names)
% 		continue;
% 	end
	
	%eval_str = sprintf('%s = %f;', par_name, par_val);
	%evalin('caller', eval_str);
    
    assignin('caller', par_name, par_val);
	
end


end

