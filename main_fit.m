%This is the MATLAB code for the fitting of dose-response curves using our
%cooperative ligand-induced dimerization model.

function main_fit(filePath)
    % Read data from the provided CSV file
    data = readtable(filePath);

    % Extract data from the table (note that the data need to be
    % transposed)
    Ilist = data.Ilist';
    Vexp15 = data.Vexp15';
    dV15 = data.dV15';
    Vexp60 = data.Vexp60';
    dV60 = data.dV60';

    % Initial parameter estimates
    params = [223.9091, 24.2419, 1.125384, 100, 100]; % [Kd, fc, Ki, V15, V60]

    % Fit model to original data
    options = optimset('MaxFunEvals',1e7,'MaxIter',1e7);
    [out, paramDist] = bootStrap(Ilist, Vexp15, Vexp60, dV15, dV60, params, options);

    % Display fitted parameters
    displayParams(out, paramDist);

    % Plot results
    plotResults(out, Ilist, Vexp15, Vexp60, dV15, dV60);
end
