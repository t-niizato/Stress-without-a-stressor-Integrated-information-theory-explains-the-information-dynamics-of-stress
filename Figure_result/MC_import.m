%% data read
interval = 2000;
file_name = what("MainComplex_PHI/Tmax_" + num2str(interval)+ "/"). path;
type_name = ["/Moderate", "/Difficult", "/Easy"];
data_name = ["/PHI/PHI_", "/SumPHI/SumPHI_","/CompNum/CompNum_", "/CompType/CompType_"];
tail_name = ["_rest1.csv", "_rest2.csv", "_task.csv"];

data_index = 4;

%% 

Active_PHI = cell(18, 3); % No time limit/ easy computation
Control_PHI = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_PHI = cell(18, 3); % Time limited (3 sec)/ hard computation

Active_sumPHI = cell(18, 3); % No time limit/ easy computation
Control_sumPHI = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_sumPHI = cell(18, 3); % Time limited (3 sec)/ hard computation

Active_Cnum = cell(18, 3); % No time limit/ easy computation
Control_Cnum = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_Cnum = cell(18, 3); % Time limited (3 sec)/ hard computation

Active_Ctype = cell(18, 3); % No time limit/ easy computation
Control_Ctype = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_Ctype = cell(18, 3); % Time limited (3 sec)/ hard computation

for ind = 1:18
    for j = 1:3
        Active_PHI{ind, j} = readmatrix(file_name + type_name(1) + data_name(data_index) + num2str(ind) +tail_name(j));
        Passive_PHI{ind, j} = readmatrix(file_name + type_name(2) + data_name(data_index) + num2str(ind) +tail_name(j) );
        Control_PHI{ind, j} = readmatrix(file_name + type_name(3) + data_name(data_index) + num2str(ind) +tail_name(j) );
    end
end

 [t1, t2, t_task] = estimate_min_time(Active_PHI, Passive_PHI, Control_PHI);
    
 start = interval/500; time = t1 + t2 + t_task - (start-1) * 3;
 time1 = t1- start +1; time2 = time1 + t_task - start +1;
 time_set = [start, t1, t2, t_task];
 times = [time, time1, time2];

if data_index < 3
    active_PHI = unite_data_IIT(Active_PHI, data_index, times, time_set);
    passive_PHI = unite_data_IIT(Passive_PHI, data_index, times, time_set);
    control_PHI = unite_data_IIT(Control_PHI, data_index, times, time_set);
    active_PHI = logIIT_zscore(active_PHI, times, time_set);
    passive_PHI = logIIT_zscore(passive_PHI, times, time_set);
    control_PHI = logIIT_zscore(control_PHI, times, time_set);

else
    active_MC = unite_data_IIT(Active_PHI, data_index, times, time_set);
    passive_MC = unite_data_IIT(Passive_PHI, data_index, times, time_set);
    control_MC = unite_data_IIT(Control_PHI, data_index, times, time_set);
end



