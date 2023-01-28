price_A = [19,18,22,21,25,19,17,21,27,29];
price_B = [22,17,20,19,24,18,16,25,28,27];
price_C = [17,13,22,23,19,17,20,21,24,28];

% a
price_A_above_price_B = (price_A > price_B);
price_A_above_price_B = sum(price_A_above_price_B)

% b
price_A_above_ALL_ary = (price_A > price_B) & (price_A > price_C);
price_A_above_ALL = sum(price_A_above_ALL_ary)

% c
price_A_above_price_B_or_C_ary = (price_A > price_B) | (price_A > price_C);
price_A_above_price_B_or_C = sum(price_A_above_price_B_or_C_ary)

% d
price_A_above_one_only_ary = price_A_above_price_B_or_C_ary ~= price_A_above_ALL_ary;
price_A_above_one_only = sum(price_A_above_one_only_ary)
