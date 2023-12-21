function [result] = bit_seq(Data)
% 二進法から十進法
    bitnum = size(Data, 2)-1;
    seq = 2.^(0:bitnum);
    result = sum(Data.*seq,2);
end

