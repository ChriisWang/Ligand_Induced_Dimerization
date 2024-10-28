function displayParams(out, paramDist)
    % Calculate mean and standard deviation of parameters
    meanParams = mean(paramDist);
    stdDev = std(paramDist);

    % Display original fitted parameters and their standard deviations
    fprintf('Original fitted parameters:\n');
    fprintf('Kd: %f, Kc: %f, Ki: %f\n', meanParams);
    fprintf('Standard deviations of fitted parameters:\n');
    fprintf('Kd: %f, Kc: %f, Ki: %f\n', stdDev);

    % Define the parameter names
    paramNames = {'Kd', 'fc', 'Ki'};

    % Create a table with the fitted parameters and their standard deviations
    T = table(out', stdDev', 'RowNames', paramNames, ...
              'VariableNames', {'FittedParameters', 'StandardDeviations'});

    % Write the table to a CSV file
    writetable(T, 'fitted_parameters.csv', 'WriteRowNames', true);
end