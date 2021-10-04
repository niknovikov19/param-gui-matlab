function init_var(varname, def_val_str)
% If variable with name varname doesn't exist
% create it and initialize it with value given in def_val_str

% Check if variable 'varname' exist in caller scope
check_str = sprintf('exist(''%s'', ''var'');', varname);
res = evalin('caller', check_str);

if ~res
    create_str = sprintf('%s = %s;', varname, def_val_str);
    evalin('caller', create_str);
end