function dirpath = get_GUI_DATA_root
% Get path to the root folder that contains data calculated via GUI-called scripts
% (Create the folder if required)

dirpath = fullfile(getenv('HOMEPATH'), 'GUI_DATA');

if ~exist(dirpath, 'dir')
	mkdir(dirpath);
end

end

