% main
function Lab4Ex3() %(a,b,x0,thres)
    % variables
    a = 2; b = -sqrt(3); x0 = 0.75; thres = 0.00001;
    % calculation
    newton_root = Newton(a,b,x0,thres)
    % matlab ans
    p = [a 0 b];
    matlab_roots = roots(p)
end

% Newton
function [newton_root] = Newton(a,b,x0,thres)
    k=1;
    xk = [x0];
    yk = [];
    dyk = [];
    % 1st iteration
    yk(k) = Poly(a,b,xk(k));
    dyk(k) = dPoly(a,xk(k));
    xk(k+1) = xk(k)-yk(k)/dyk(k);
    % nth iteration
    fprintf(1,'|  k | xk      | yk      |\n')
    fprintf(1,'==========================\n')
    while abs(xk(k+1)-xk(k)) >= thres
        k = k + 1;
        yk(k) = Poly(a,b,xk(k));
        dyk(k) = dPoly(a,xk(k));
        xk(k+1) = xk(k)-yk(k)/dyk(k);
        fprintf(1,'| %2d | %2.5f | %2.5f |\n', k-1, xk(k), yk(k))
    end
    newton_root = xk(length(xk));
end

% subfunctions
function y = Poly(a,b,x)
    y = a.*(x.^2) + (b);
end
function dy = dPoly(a,x)
    dy = 2.*a.*x;
end