function [response_matrix, peaks] = estimate_modulation_depth_with_synthetic_lights(...
                lambda, ratio_spectra_mat_log, ratio_strings, light_hbw, nm_step_size)
            
    % Create vector for all possible peak wavelengths that you want to use
    % for creating a Gaussian spectral light distribution
    peak_vector = (lambda(1) : nm_step_size : lambda(end))';
    xLimits = [lambda(1) lambda(end)];
    
    % preallocate
    response_trapz = zeros(1, size(ratio_spectra_mat_log, 2));
    response_matrix = zeros(length(peak_vector), length(response_trapz));
    
    for ind = 1 : length(peak_vector)
        
        % Light SPD (normalized to peak)
        SPD = monochromaticLightAsGaussian(peak_vector(ind), light_hbw, nm_step_size, xLimits);
        
        % Normalize to sum
        SPD_sum = trapz(SPD);
        SPD_sumNorm = SPD / SPD_sum;
            % SPD_sum = trapz(SPD_sumNorm) % should be 1
                
        % Now you want to weigh each ratio spectra with this SPD
        for spec = 1 : size(ratio_spectra_mat_log, 2)
            
            % Ratio spectra, in LINEAR
            ratio_spec_lin = 10.^ratio_spectra_mat_log(:,spec);
                                
            % Vector response, per wavelength, in LINEAR            
            response_spec_linear = ratio_spec_lin .* SPD_sumNorm;
            
            % Scalar response, trapezoidal integration
            
            % trapz can't ignore NaNs
            response_spec_linear = response_spec_linear(~isnan(response_spec_linear));            
            response_trapz(spec) = trapz(response_spec_linear);        
            
        end
        
        response_matrix(ind, :) = response_trapz;
        
    end
    
    % get the maximal separations per pair
    % first remove infinite values
    response_matrix(isinf(response_matrix)) = NaN;
    [spectra_max_values, max_indices] = max(response_matrix);
    max_spectra = lambda(max_indices);
    
    % Combine wavelengths and max values
    peaks.lambda = max_spectra;
    peaks.maxValue = spectra_max_values;
    peaks.lambdaIndex = max_indices;
    
            
end



