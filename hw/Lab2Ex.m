% q1
% the matrix
A = [3,7,-4,12; -5,9,10,2; 6,13,8,11; 15,5,4,1]
% a
maxC = max(A)
minC = min(A)
% b
maxC = max(A')
minC = min(A')

clear
%q2
hourly_rate = [25,32,27,30,38];
hours_worked = [40,35,33,31,42];
output = [120,87,90,78,100];

% element-wise multiplication
worker_earn = hourly_rate .* hours_worked

% total salary paid
total_salary_paid = sum(worker_earn)

% product
number_of_product = sum(output)

% avg. cost
average_cost = total_salary_paid / number_of_product

% avg. time
average_time = sum(hours_worked) / number_of_product

% efficient of each worker
efficiency = worker_earn ./ output;
[most_efficient,most_efficient_worker] = max(efficiency);
[least_efficient,least_efficient_worker] = min(efficiency);
most_efficient_worker
least_efficient_worker

clear
%q3
% a
A = [1,1;-1,1]
b = [5;-2]
inv(A)*b
%b
A2 = [-2,1;-2,1]
b2 = [-5;-5.00001]
pinv(A2)*b2
%c
A3 = [2,-1,1,-2; -1,4,-1,3; 3,-7,-2,1]

b3 = [7;20;-75]
%A3\b3
pinv(A3)*b3

clear
%q4
% a
x = [1,2.3,3.1,4.8,5.6,6.3]
X = [1,1,1,1,1,1;x]'
Y = [2.6,2.8,3.1,4.7,5.1,5.3]'
beta = ((X'*X)^-1) * (X'*Y)
y = Y'

% b
beta = regress(Y,X)

%c
scatter(x,y);grid on; hold on;
plot(x,beta(1) + beta(2)*x)

clear
%q5

f = @(x) 3*x.^4 - 5*x.^3 - 28*x.^2 -5*x + 200;
x = -1:0.1:1;
y = f(x)

%a
plot(x,y),ylabel('y'),xlabel('x'),grid
[x1,y1] = ginput(1)

%b
[max_y,index] = max(y);
max_x = x(index);
max_y
max_x