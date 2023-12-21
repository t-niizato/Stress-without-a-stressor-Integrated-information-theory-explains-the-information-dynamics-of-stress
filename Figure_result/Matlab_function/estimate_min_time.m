function [rest_time_1, rest_time_2, rest_time_task] = estimate_min_time(Active_PHI, Passive_PHI, Control_PHI)
    
    rest_bf = []; rest_af = []; task=[];

    for  ind = 1:18
        rest_bf = [rest_bf, size(Active_PHI{ind, 1}, 1), size(Passive_PHI{ind, 1}, 1), size(Control_PHI{ind, 1}, 1)];
        rest_af = [rest_af, size(Active_PHI{ind, 2}, 1), size(Passive_PHI{ind, 2}, 1), size(Control_PHI{ind, 2}, 1)];
        task = [task, size(Active_PHI{ind, 3}, 1), size(Passive_PHI{ind, 3}, 1), size(Control_PHI{ind, 3}, 1)];
    end

    rest_time_1 = min(rest_bf);
    rest_time_2 = min(rest_af);
    rest_time_task = min(task);
        
end

