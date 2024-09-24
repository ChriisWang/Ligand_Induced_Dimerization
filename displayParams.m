function displayParams(out, paramDist, Ilist, Vexp15, Vexp60, dV15, dV60)

    % Standard deviation of fitted parameters
    stdDev = std(paramDist);

    % Display fitted parameters and their standard deviations
    fprintf('Original fitted parameters:\n');
    fprintf('Kd: %f, fc: %f, Ki: %f, V15: %f, V60: %f\n', out);
    fprintf('Standard deviations of fitted parameters:\n');
    fprintf('Kd: %f, fc: %f, Ki: %f, V15: %f, V60: %f\n', stdDev);

    % Define the parameter names
    paramNames = {'Kd', 'fc', 'Ki', 'V15', 'V60'};

    % Create a table with the fitted parameters and their standard deviations
    T = table(out', stdDev', 'RowNames', paramNames, ...
              'VariableNames', {'FittedParameters', 'StandardDeviations'});

    % Write the table to a CSV file
    writetable(T, 'fitted_parameters.csv', 'WriteRowNames', true);
    
end