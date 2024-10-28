function y = min_function(params, Ilist, Vexp1, Vexp2, dV1, dV2, Et1, Et2)
    Kd = abs(params(1)) + eps;
    Kc = abs(params(2)) + eps;
    Ki = abs(params(3)) + eps;

    Vsim1 = 100 * function_LID(Kd, Kc, Ki, Et1, Ilist);
    Vsim2 = 100 * function_LID(Kd, Kc, Ki, Et2, Ilist);

    y = sum(((Vsim1(:) - Vexp1)./dV1).^2) + sum(((Vsim2(:) - Vexp2)./dV2).^2);
end
