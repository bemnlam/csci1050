function [bestR,bestL,minCost] = Lab3Ex()
    bestR = fminbnd(@calCost,0,100);
    bestL = calL(bestR);
    minCost = calCost(bestR);
end

function L = calL(R)
    area = 1600;
    L = (area- ((pi.*R.^2)./2))./(2.*R);
end

function cost = calCost(R)
    cost = (calL(R)*2+2*R)*30 + (pi*R)*40;
end