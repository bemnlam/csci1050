target = 1000000;
start = 10000;
deposit = 10000;
interest = 1.06;

balance = start;

year = 0;
while balance < target
    balance = (balance*1.06) + deposit;
    year = year + 1;
end

year