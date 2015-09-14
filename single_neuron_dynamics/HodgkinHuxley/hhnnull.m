function ydot = hhnnull(y)
%y(1,2,3,4) = v, gk, gna, gl
[params, iext] = gethhparams();
phi = params(8).^((params(7)-6.3)./10);
a = 0.97; b =-1.05;

ydot(1) = (alphan(y(1))./(alphan(y(1)) + betan(y(1))) - y(2))/taun(y(1)); %ngate


    function val = taun(v)
        val = 1/(alphan(v) + betan(v));
    end

    function val = alphan(v)
        if abs(v+50)>=1.e-4
            val = -phi.*0.01.*(v+50)./(exp(-(v+50)./10)-1);
        else
            val = phi.*0.1./(1-(v+50)./20);
        end
    end

    function val = alpham(v)
        if abs(v+50)>=1.e-4
            val = -phi.*0.1.*(v+35)./(exp(-(v+35)./10)-1);
        else
            val = phi.*1./(1-(v+35)./20);
        end
    end

    function val = betan(v)
        val = 0.125.*phi.*exp(-(v+60)./80);
    end

    function val = betam(v)
        val = 4*phi*exp(-(v+60)/18);
    end


end