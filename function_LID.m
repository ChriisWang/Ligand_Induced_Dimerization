function y = function_LID(Kd,fc,Ki,Et,Ilist)
    
    for nn=1:length(Ilist)
        It = Ilist(nn);
        a = 2/Kd * (1/fc + It./(Ki * fc) + It.^2/(Ki^2 * fc));
        b = (1+ It./(Ki * fc)); 
        c = -Et;
        % Calculate Minit
        Minit = (-b + sqrt(b.^2 - 4*a*c))./(2*a);
        % Calculate MIinit, Dinit, DIinit, DI2init, Iinit
        MIinit = (Minit * It)./(Ki * fc); 
        Dinit = Minit^2./(Kd * fc);
        DIinit = (Minit^2 * It)/(Kd * Ki * fc); 
        DI2init = (Minit^2 * It^2)/(Kd * Ki^2 * fc);
        Iinit = max([0,It - MIinit - DIinit - 2*DI2init]);

        % Perform monomer optimization
        out = fminsearch(@monomer, [Minit, Iinit]);
        % Extract optimized values
        M = out(1);
        I = out(2);
        % Calculate D, DI, Dctr
        D = M^2./(Kd * fc);
        DI = M^2 * I/(Kd * Ki * fc); 
        % Dimer concentration in the control experiment.
        Dctr = (4 * Et + (Kd * fc) - sqrt(8*Et * (Kd * fc) + (Kd * fc)^2))/8;
        % Calculate Vsim and store in the array
        Vsim(nn) = (D + 0.5 * DI) / Dctr;
    end

    y = Vsim;

    function y = monomer(in)

        % Simulate the monomer behavior
        M=in(1);
        I=in(2);
        MI = (M * I)./(Ki * fc); 
        D = M^2./(Kd * fc);
        DI = (M^2 * I)/(Kd * Ki * fc); 
        DI2 = (M^2 * I^2)/(Kd * Ki^2 * fc);
        Esim = M + MI + 2*(D + DI + DI2); 
        Isim = I + MI + DI + 2*DI2; 
        % Calculate the squared difference
        y = ((Esim - Et) / Et)^2 + ((Isim - It) / It)^2;
    end
end

