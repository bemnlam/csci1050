clear

P = 10000.0
r = 0.035
%n = [1.0,4.0,12.0];
t = [1:20];

%V = @(p) (m.*R.*T ./ p); fplot(p,[20,100])
%.^(n.*t);fplot(t,[1,20])

t = [1:20];

A_cont = P.*exp(r.*t);

n = 1;
A_1 = (P.*(1+(r./n)).^(n.*t));

n = 4;
A_4 = (P.*(1+(r./n)).^(n.*t));

n = 12;
A_12 = (P.*(1+(r./n)).^(n.*t));

subplot(2,3,1)
plot(t,A_1,t,A_4,t,A_12,t,A_cont);

xlabel('time (year)');
ylabel('amount ($)');
title('Amount versus time');
legend('annual compounding','quarterly compounding','monthly compounding', 'continuous compounding');
axis([0 20 10000 22000]);

% another subplot
subplot(2,3,2)
plot(t,A_cont-A_1,t,A_cont-A_4,t,A_cont-A_12);
xlabel('time (year)');
ylabel('amount ($)');
title('Amount versus time');
legend('continuous - annual compounding','continuous - quarterly compounding','continuous - monthly compounding');
axis([0 20 0 250]);

%redo a, only semilogy gives straight line
subplot(2,3,4);
semilogy(t,A_1,t,A_4,t,A_12,t,A_cont);
xlabel('time (year)');
ylabel('log(amount)');
title('log(Amount) versus time');
subplot(2,3,5);
semilogx(t,A_1,t,A_4,t,A_12,t,A_cont);
xlabel('log(time)');
ylabel('amount ($)');
title('Amount versus log(time)');
subplot(2,3,6);
loglog(t,A_1,t,A_4,t,A_12,t,A_cont);
xlabel('log(time)');
ylabel('log(amount)');
title('log(Amount) versus log(time)');