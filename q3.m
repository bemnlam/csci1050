%more definition of function search "Function Definition"
%minsearch: http://bime-matlab.blogspot.hk/2006/10/84-fminsearch.html
%a user define function
function [ z1,z2,z3 ] = q3( x,y )
    z1 = x+y; %one answer: sum()
    z2 = x.^y;
    %q3_xten()
    f4([0,0])
    %z3 = fminsearch(f4,0);
    vx = [5, -3, 0, 0, 8];vy = [2, 4, 0, 5, 7];
    z3 = vy(x&y)
end

function f = f4(ary)
    ary(1)
    ary(2)
	f = ary(1).*exp(-ary(1).^2-ary(2).^2);
end

function [] = q3_xten()
    q3_x = [-3.125, 12.3, -92.23231,721.12]
    fix(q3_x)
    floor(q3_x)
    sign(q3_x) %only +1/0/-1

    %evaluate 1 by 1
    sin(q3_x.^2+5)
    %not work: sin(q3_x^2+5)
    radtodeg(pi)
    %
    date
    %make a global variable
    global GVAR
    x = [0:0.1:1];
    GVAR = 0.025.*x.^5 - 0.0625.*x.^4 - 0.333.*x.^3 + x.^2
    %plot(GVAR);
end

%finding zero around value x of function f
%   fzero('f', x)