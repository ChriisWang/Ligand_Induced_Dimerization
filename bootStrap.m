function [out, paramDist] = bootStrap(Ilist, Vexp1, dV1, Et1, Vexp2, dV2, Et2, initialParams, options)
    % Fit model to original data
    out = fminsearch(@(p) min_function(p, Ilist, Vexp1, Vexp2, dV1, dV2, Et1, Et2), initialParams, options);

    % Bootstrap settings
    nBootstrap = 100; % Number of bootstrap samples
    paramDist = zeros(nBootstrap, 3); % Store fitted parameters for each bootstrap sample

    for n = 1:nBootstrap
       Vresampled1 = normrnd(Vexp1, dV1);
       Vresampled2 = normrnd(Vexp2, dV2);

       bootstrapOut = fminsearch(@(p) min_function(p, Ilist, Vresampled1, Vresampled2, dV1, dV2, Et1, Et2), initialParams, options);
       paramDist(n, :) = bootstrapOut; % Store fitted parameters
    end
end
