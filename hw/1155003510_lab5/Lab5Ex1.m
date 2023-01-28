clear

R = 286.7;
T = 293.0;
V = [20:100];
m = [1.0,3.0,7.0];
%p = @(V) (m.*R.*T ./ V); fplot(p,[20,100],'b');xlabel('Volume (V)');ylabel('gas pressure (N/m^2)');
p_1 =  (m(1).*R.*T ./ V)
p_3 =  (m(2).*R.*T ./ V)
p_7 =  (m(3).*R.*T ./ V)
plot(V,p_1,'r',V,p_3,'g',V,p_7,'b'),xlabel('Volume (V)'),ylabel('gas pressure (N/m^2)');
legend('m=1kg','m=3kg','m=7kg');