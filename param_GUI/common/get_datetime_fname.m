function fname = get_datetime_fname(ext, postfix)
% Create filename based on the current date and time

init_var('postfix', '''''');

fname = datestr(datetime, 0);
fname = strrep(fname, ' ', '_');
fname = strrep(fname, ':', '-');
fname = [fname, postfix, ext];

end

