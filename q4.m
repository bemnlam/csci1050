clear


x = [4,-9,25];
y = [];

for i=1:length(x)
    if x(i)<0
        y(i) = x(i)
    else
        y(i) = sqrt(i)
    end
end

%name = 'Leslie Student'
%user_str = input('prompt: ','s')
%res = input('do u want to cont? Y/N [Y]: ', 's');
%if (isempty(res)) | (res == 'Y')
%    res = 'Y'
%else
%    res = 'N'
%end
%user_num = input('num: ')

clear
x = [10,1000,-10,100];
y = NaN*x;
for k = 1:length(x)
    if x(k) < 0
        continue
    end
    y(k) = log10(x(k))
end
y
clc
A = [0,-1,4; 9,-14,25; -34,49,64]
C = (A>=0)
A(C) = sqrt(A(C))
A(~C) = A(~C) + 50
