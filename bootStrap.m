function [out, paramDist] = bootStrap(Ilist, Vexp15, Vexp60, dV15, dV60, params, options)
    out = fminsearch(@(p) min_function(p, Ilist, Vexp15, Vexp60, dV15, dV60), params, options);

    % Bootstrap settings
    nBootstrap = 3;
    paramDist = zeros(nBootstrap, 5);

    for n = 1:nBootstrap
        Vresampled15 = normrnd(Vexp15, dV15);
        Vresampled60 = normrnd(Vexp60, dV60);

        bootstrapOut = fminsearch(@(p) min_function(p, Ilist, Vresampled15, Vresampled60, dV15, dV60), params, options);
        paramDist(n, :) = bootstrapOut;
    end
end

function y = min_function(params, Ilist, Vexp15, Vexp60, dV15, dV60)
    Kd = abs(params(1))+eps;
    fc = abs(params(2))+eps;
    Ki = abs(params(3))+eps;
    V15 = abs(params(4));
    V60 = abs(params(5));

    Vsim15 = V15*function_LID(Kd, fc, Ki, 15, Ilist);
    Vsim60 = V60*function_LID(Kd, fc, Ki, 60, Ilist);

    y = sum(((Vsim15 - Vexp15)./dV15).^2) + sum(((Vsim60 - Vexp60)./dV60).^2);
end