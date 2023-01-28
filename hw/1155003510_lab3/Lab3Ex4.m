equation = @(x) 10.*exp(-2.*x);
x = [0:0.1:2];
plot(x,equation(x)),xlabel('x'),ylabel('equation(x)')
