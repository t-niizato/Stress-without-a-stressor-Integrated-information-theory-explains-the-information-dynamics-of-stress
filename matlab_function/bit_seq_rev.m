function [name] = bit_seq_rev(n)
%   数字 n -> 新しい数字n
n_bit = dec2bin(n, 5);
N = zeros(1, 5);
name = ["Fz", "Cz", "Pz", "ECG", "EDA"];

for i = 1:5
    if n_bit(6-i) == "1"
        N(i) = 1;
    end
end

name = name(N==1);

end

