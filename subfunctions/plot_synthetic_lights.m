function plot_synthetic_lights(lambda, response_matrix, vis_spectra, peaks_hbw, ratio_strings, light_hbw)

    fig = figure('Color', 'w', 'Name', 'Synthetic Lights');
            scrsz = get(0,'ScreenSize'); % get screen size for plotting
            set(fig, 'Position', ...
                [0.05*scrsz(3) 0.015*scrsz(4) 0.62*scrsz(3) 0.95*scrsz(4)])
            
        rows = length(response_matrix);
        cols = 2;

    for hbw = 1 : length(response_matrix)
       
        ind_base = (hbw-1)*cols; 
        
        sp(hbw,1) = subplot(rows,cols, ind_base+1);
            plot_synthetic_spectra_subplot(lambda, response_matrix{hbw}, vis_spectra, ...
                peaks_hbw{hbw}, ratio_strings, ind_base+1, light_hbw(hbw))
            
        sp(hbw,2) = subplot(rows,cols, ind_base+2);
            plot_synthetic_scalar_subplot(lambda, response_matrix{hbw}, vis_spectra, ...
                peaks_hbw{hbw}, ratio_strings, ind_base+2, light_hbw(hbw))
    end
    
end

function plot_synthetic_spectra_subplot(lambda, response_matrix, vis_spectra, peaks_hbw, ratio_strings, ind, light_hbw)

     % GHETTO FIX FOR CRAZY SWS/LWS -ratio
     response_matrix(:,5) = NaN;

     semilogy(lambda, response_matrix);        
        tit = title(['Modulation Depths, hbw = ', num2str(light_hbw), ' nm'], 'FontSize', 8);
        lab = ylabel('Arbitrary Modulation depth', 'FontSize', 7);
        leg = legend(ratio_strings, 'Location', 'EastOutside');
            legend boxoff

     set(gca, 'XLim', [400 650], 'YLim', [0.01 2000])
     set(leg, 'FontSize', 7)
            
end



function plot_synthetic_scalar_subplot(lambda, response_matrix, vis_spectra, peaks_hbw, ratio_strings, ind, light_hbw)
    
    % GHETTO FIX FOR CRAZY SWS/LWS -ratio
    peaks_hbw.maxValue(:,5) = NaN;

    hold on
    for i = 1 : length(peaks_hbw.lambda)
        p(i) = stem(peaks_hbw.lambda(i), log10(peaks_hbw.maxValue(i)));
    end
    hold off
    tit = title('Max Peak values', 'FontSize', 8);
    lab = ylabel('Arbitrary Modulation depth', 'FontSize', 7);
    leg = legend(ratio_strings, 'Location', 'EastOutside');
        legend boxoff

    set(gca, 'XLim', [400 650])
    set(leg, 'FontSize', 7)
        
end
