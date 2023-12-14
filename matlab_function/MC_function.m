function [phis,sum_phis, comp, comp_num] = MC_function(data, interval, params, options, lists)
% data, params -> PHI, Main complex, Main complex number
%time = size(data, 1);

    time = size(data, 1);
    time_step = fix(time/500);
    start = interval/500;
    
    phis = zeros(1, time_step);
    sum_phis = zeros(1, time_step);
    comp = zeros(time_step, length(lists));
    comp_num = zeros(1, time_step);
    
    check = cell(1, time_step); 
   
    for i = start:time_step
        check{i} = data(500*i-interval+1:500*i, :).';
    end
    
    
    parfor i = start:time_step
        a = zeros(1, length(lists));
        try
            [~, ~, main_complexes, phis_main_complexes, ~] = Complex_search(check{i}, params, options );
            phis(i) = phis_main_complexes(1);
            sum_phis(i) = sum(phis_main_complexes);
            a(main_complexes{1}) =  1;
            comp(i, :) = a;
            comp_num(i) = size(phis_main_complexes, 1);
        catch
           phis(i) = NaN;
           sum_phis(i) = NaN;
           comp_num(i) = NaN;
           comp(i, :) = NaN(1, 5);
        end
        
    end
    
end

