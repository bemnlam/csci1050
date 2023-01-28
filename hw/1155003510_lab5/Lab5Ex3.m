clear

%x = 1;y=1;
[x,y]=meshgrid(0:0.05:1);
T = 80.*exp(-(x-1).^2).*exp(-3.*(y-1).^2);

subplot(1,2,1)
mesh(x,y,T),xlabel('x'),ylabel('y'),zlabel('Temperature'),title('Temperature versus (x,y)');
subplot(1,2,2)
contour(x,y,T),xlabel('x'),ylabel('y'),zlabel('Temperature'),title('Temperature versus (x,y)');

T_when_x_and_y_are_zero = 80.*exp(-(0-1).^2).*exp(-3.*(0-1).^2)