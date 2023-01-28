function result = find_zero(input)
    format long e
    t = -10:1:10;
    for i=1:length(t),
        tmp(i) = round(fzero(@poly,t(i)));
    end
    result = unique(tmp);
end
% subfunction
function y = poly(x)
    y = 3.*x.^3-12.*x.^2-33.*x+90;
end