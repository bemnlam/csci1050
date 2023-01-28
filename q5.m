% x = [0:0.01:5];
% y = exp(-1.2*x).*sin(10*x+5);
% subplot(1,2,1)
% plot(x,y),axis([0 5 -1 1])
% x = [-6:0.01:6];
% y = abs(x.^3-100);
% subplot(1,2,2)
% plot(x,y,'o--c'),axis([-6,6,0,350])
% 
% x = [0:0.01:2];
% y = sinh(x);
% z = tanh(x);
% subplot(1,2,1)
% plot(x,y,'g*',x,z,'--'),xlabel('x'),ylabel('Hyperbolic Sine and Tangent');
% legend('sinh(x)','tanh(x)');
% 
% subplot(1,2,2)
% semilogx(x,y,'g*',x,z,'--'),xlabel('x'),ylabel('Hyperbolic Sine and Tangent');
% legend('sinh(x)','tanh(x)');

fun1 = 'x.^2-4';
fun_inline = inline(fun1);
[x, value] = fzero(fun_inline, [0,3])

[X,Y] = meshgrid(-2:0.1:2);
Z = X.*exp(-((X- Y.^2).^2+Y.^2));
contour(X,Y,Z),xlabel('x'),ylabel('y')
meshgrid(X,Y)
% function y = poly(x)
%  y = 0.025.*x.^5-0.0625.*x.^4-0.333.*x.^3 + x.*2;
% end