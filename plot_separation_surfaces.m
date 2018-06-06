function plot_separation_surfaces()

    close all

    % Parameters
    light_hbw = [1 10 25];
    nm_step_size = 1; % [nm]
    
    %% INITIALIZE

        set_paths()    
        param.spectra_set = 'default';
        [vis_spectra, vis_spectra_retinal, ratio_spectra, ratio_strings] = ...
            generate_spectra(param);
        
        % clean the ratio_spectra        
        threshold = 0.1; % exclude spectral points that have sensitivity less than this
        [lambda, ratio_spectra_mat_log, peaks] = clean_ratio_spectra(vis_spectra, ratio_spectra, ratio_strings, threshold);
        
        % plot the ratio spectra
        % plot_ratio_spectra(lambda, ratio_spectra_mat_log, ratio_strings, vis_spectra, peaks, 'asFigure')
        
        
    %% Simulate the effect of Light HBW to your photoreceptor class separability

        for hbw = 1 : length(light_hbw)            
            [response_matrix{hbw}, peaks_hbw{hbw}] = estimate_modulation_depth_with_synthetic_lights(...
                lambda, ratio_spectra_mat_log, ratio_strings, light_hbw(hbw), nm_step_size);
        end
        
        plot_synthetic_lights(lambda, response_matrix, vis_spectra, peaks_hbw, ratio_strings, light_hbw)

end

