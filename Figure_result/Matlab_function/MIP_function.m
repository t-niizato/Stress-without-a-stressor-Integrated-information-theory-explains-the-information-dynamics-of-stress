function [MIP_cut,phis] = MIP_function(data, interval, params, options)
% data -> MIP_phis and MIP_cuts

time = size(data, 1);
time_step = fix(time/500);
start = interval/500;

phis = zeros(1, time_step);
MIP_cut = zeros(time_step, 5);

check = cell(1, time_step); 

for i = start:time_step
    check{i} = data(500*i-interval+1:500*i, :).';
end

parfor i = start:time_step
    try
        [MIP_cut(i, :), phis(i)] = MIP_search(check{i}, params, options);
    catch
        MIP_cut(i, :) = NaN(1, 5);
        phis(i) = NaN;
    end
end

end

