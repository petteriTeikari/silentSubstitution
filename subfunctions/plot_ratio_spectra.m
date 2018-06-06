function plot_ratio_spectra(lambda, ratio_spectra_mat, ratio_strings, vis_spectra, peaks, plotAs)
    
    if strcmp(plotAs, 'asFigure')
        
        fig = figure('Color', 'w', 'Name', 'Ratio Spectra');
            scrsz = get(0,'ScreenSize'); % get screen size for plotting
            set(fig, 'Position', ...
                [0.05*scrsz(3) 0.015*scrsz(4) 0.42*scrsz(3) 0.95*scrsz(4)])
            
        rows = 3;
        cols = 1;
            
    elseif strcmp(plotAs, 'asSubplot')
        
        % nothing yet
        
    end     
    
    sp = 0;
      
    % Plot Sensitivities
    vis_names = fieldnames(vis_spectra);
    [~, vis_spectra_mat] = convert_spectra_str_to_matrix(vis_spectra);
    sp = sp+1;
    s(sp) = subplot(rows, cols, sp);
        p1 = plot(lambda, vis_spectra_mat);        
        tit(sp) = title('Visual Sensitivities');
        leg(sp) = legend(vis_names, 'Location', 'EastOutside');
            legend boxoff
    
    % Plot Absolute Trimmed LOG ratios
    sp = sp+1;
    s(sp) = subplot(rows, cols, sp);
        p(sp,:) = plot(lambda, ratio_spectra_mat);        
        tit(sp) = title('Absolute Trimmed LOG Ratios');
        leg(sp) = legend(ratio_strings, 'Location', 'EastOutside');
            legend boxoff
            
    % Plot Peak values
    sp = sp+1;
    s(sp) = subplot(rows, cols, sp);
    
        hold on
        for i = 1 : length(peaks.lambda)
            p(sp,i) = stem(peaks.lambda(i), peaks.maxValue(i));
        end
        hold off
        tit(sp) = title('Max Peak values');
        leg(sp) = legend(ratio_strings, 'Location', 'EastOutside');
            legend boxoff
        
    % Style
    set(s, 'XLim', [400 650])
    set(leg, 'FontSize', 7)
    

end