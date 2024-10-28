%This is the MATLAB code for the fitting of dose-response curves using our
%cooperative ligand-induced dimerization model.

function main_fit(filePath)
    % Read data from the provided CSV file
    data = readtable(filePath);

    % Extract data from table
    Ilist = data.Ilist;
    Vexp1 = data.Vexp1;
    dV1 = data.dV1;
    Vexp2 = data.Vexp2;
    dV2 = data.dV2;

    % Define the enzyme concentrations
    Et1 = 15; %nM
    Et2 = 60; %nM
    
    % Initial parameter estimates
    initialParams = [300, 20, 1]; % [Kdinit, Kcinit, Kiinit]

    % Optimization options
    options = optimset('MaxFunEvals',1e7,'MaxIter',1e7);

    % Perform the fitting
    [out, paramDist] = bootStrap(Ilist, Vexp1, dV1, Et1, Vexp2, dV2, Et2, initialParams, options);

    % Display fitted parameters
    displayParams(out, paramDist);

    % Plot results
    plotResults(out, Ilist, Vexp1, Vexp2, dV1, dV2, Et1, Et2);

end
