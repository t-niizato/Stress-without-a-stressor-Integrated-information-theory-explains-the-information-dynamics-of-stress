function [result] = logIIT_zscore(Data, times, time_set)
    result = zeros(18, times(1));

    for ind = 1:18
        m = mean(Data(ind, 1:time_set(2)));
        st = std(Data(ind, 1:time_set(2)));
        result(ind, :) = (Data(ind, :) - m)/st;
    end
end