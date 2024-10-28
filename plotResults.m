function plotResults(out, Ilist, Vexp1, Vexp2, dV1, dV2, Et1, Et2)

    % Calculate the simulated responses for the final parameters
    Isim = logspace(-3, 4, 100);
    Vsim1 = 100 * function_LID(out(1), out(2), out(3), Et1, Isim);
    Vsim2 = 100 * function_LID(out(1), out(2), out(3), Et2, Isim);

    % Create a new figure
    figure;

    % Plot fitted curve for 15 nM and 60 nM
    semilogx(Isim, Vsim1, 'r-', 'Color', '#9ACA7C', 'LineWidth', 1.5); hold on;
    semilogx(Isim, Vsim2, 'b-', 'Color', '#7198F8', 'LineWidth', 1.5);
    
    % Plot experimental data for 15 nM and 60 nM
    errorbar(Ilist, Vexp1, dV1, 'diamond', 'LineWidth', 1.5, 'MarkerSize', 8, 'Color', 'black', 'MarkerEdgeColor', 'black', 'MarkerFaceColor', '#9ACA7C'); 
    errorbar(Ilist, Vexp2, dV2, 'square', 'LineWidth', 1.5, 'MarkerSize', 8, 'Color', 'black', 'MarkerEdgeColor', 'black', 'MarkerFaceColor', '#7198F8');
    
    hold off;

    % Set labels and legend with font settings
    xlabel('Inhibitor Concentration (nM)', 'FontSize', 18);
    ylabel('% Activity', 'FontSize', 18);
    legend('','','15 nM','60 nM','FontSize', 18);

    % Set ticks on the x-axis 
    xticks([0.01, 0.1, 1, 10, 100, 1000, 10000]);
    xticklabels({'0.01', '0.1', '1', '10', '100', '1000','10000'});

    % Set axis limits
    xlim([0.002, 10000]);  % Set y-axis limits
    ylim([0, 250]);  % Set y-axis limits


    % Customize axis appearance
    set(gca, 'FontSize', 18, 'FontWeight', 'bold', 'LineWidth', 2); % Set font size and thickness for the axis
    
    % Save the figure as a PNG file
    print(gcf,'plot_fitted_data.png','-dpng','-r200');    

end