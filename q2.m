% first editor program
x = sqrt([5:2:13]);
y = sin(x);
plot(x,y);
title('some function');
gtext('some text');
ylabel('sin(x)');

%example script
g = 9.81;
tfinal = input('enter the finishing time: ');
time = 0:0.05:tfinal;
v = g*time;
plot(time,v),xlabel('time'),ylabel('velocity')
title('time VS velocity')
