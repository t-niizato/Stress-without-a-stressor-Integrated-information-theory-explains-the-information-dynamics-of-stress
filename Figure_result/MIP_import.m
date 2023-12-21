%clearvars;

%% data read
file_name = what("MIP_PHI/Tmax_2000_tau_50/"). path;
type_name = ["/Moderate", "/Difficult", "/Easy"];
data_name = ["/MIP_PHI/MIP_PHI_",  "/MIP_cut/MIP_cut_"];
tail_name = ["_rest1.csv", "_rest2.csv", "_task.csv"];
% set interval = T_max
interval = 2000;


%% set data

Active_MIP = cell(18, 3); % No time limit/ easy computation
Control_MIP = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_MIP  = cell(18, 3); % Time limited (3 sec)/ hard computation

Active_MIP_cut = cell(18, 3); % No time limit/ easy computation
Control_MIP_cut = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_MIP_cut = cell(18, 3); % Time limited (3 sec)/ hard computation

data_index = 1;

for ind = 1:18
    for j = 1:3
        Active_MIP{ind, j} = readmatrix(file_name + type_name(1) + data_name(data_index) + num2str(ind) +tail_name(j));
        Passive_MIP{ind, j} = readmatrix(file_name + type_name(2) + data_name(data_index) + num2str(ind) +tail_name(j) );
        Control_MIP{ind, j} = readmatrix(file_name + type_name(3) + data_name(data_index) + num2str(ind) +tail_name(j) );
    end
end

if data_index == 1
    [t1, t2, t_task] = estimate_min_time(Active_MIP, Control_MIP, Passive_MIP);
    
    start = interval/500; time = t1 + t2 + t_task - (start-1) * 3;
    time1 = t1- start +1; time2 = time1 + t_task - start +1;
    time_set = [start, t1, t2, t_task];
    times = [time, time1, time2];
    
    % PHI -> log(Phi) -> z(log(Phi))
    active_MIP_PHI = unite_data_MIP(Active_MIP, data_index, times, time_set);
    passive_MIP_PHI = unite_data_MIP(Passive_MIP, data_index, times, time_set);
    control_MIP_PHI = unite_data_MIP(Control_MIP, data_index, times, time_set);
  
elseif data_index == 2
    active_MIP = unite_data_MIP(Active_MIP, data_index, times, time_set);
    passive_MIP = unite_data_MIP(Passive_MIP, data_index, times, time_set);
    control_MIP = unite_data_MIP(Control_MIP, data_index, times, time_set);

end

