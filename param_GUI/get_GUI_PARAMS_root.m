function dirpath = get_GUI_PARAMS_root
% Get path to the root folder that contains GUI parameters
% (Create the folder if required)

dirpath = fullfile(getenv('HOMEPATH'), 'GUI_DATA');

if ~exist(dirpath, 'dir')
	mkdir(dirpath);
end

end

