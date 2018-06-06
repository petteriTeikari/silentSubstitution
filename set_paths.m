function set_paths()

    fileName = mfilename;
    fullPath = mfilename('fullpath');
    path_Code = strrep(fullPath, fileName, '');
    
    % add subfunctions
    addpath(fullfile(path_Code, 'subfunctions'));
    path_photoreceptor_pools = fullfile(path_Code, 'photoreception_tools');
    addpath(path_photoreceptor_pools)
    
    addpath(fullfile(path_photoreceptor_pools, 'nomogram'))
    addpath(fullfile(path_photoreceptor_pools, 'templates'))
    addpath(fullfile(path_photoreceptor_pools, 'ocularmedia'))