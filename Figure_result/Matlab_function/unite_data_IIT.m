function [data] = unite_data_IIT(Data, type, times, time_set)
%   cell dataの結合
    data = zeros(18, times(1));

    for ind = 1:18
        data(ind, 1:times(2)) = Data{ind, 1}(time_set(1): time_set(2));
        data(ind, (times(2)+1):times(3)) = Data{ind, 3}(time_set(1):time_set(4));
        data(ind, (times(3)+1):times(1)) = Data{ind, 2}(time_set(1):time_set(3));
    end
    
    if type  < 4
        for ind = 1 : 18
            a = sum(isnan(data(ind, :)));
            if a > 0
                data(ind,:) =  fillmissing(data(ind,:),'movmedian',40);
                [ind, a]
            end
        end
    end
    
    if type < 3
        for ind = 1:18
            data(ind, :) = log10(data(ind, :));
        end  
    end
    
    if type < 4
        for ind = 1:18
                data(ind, :) = data(ind, :) - mean(data(ind, 1:time_set(2)), 2);
        end  
    end
    
end

