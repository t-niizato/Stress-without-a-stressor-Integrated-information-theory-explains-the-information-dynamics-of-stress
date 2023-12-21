clearvars;

%% data_set
import_data;

%% parameters for phi computation
params.tau = 50; % time lag
options.type_of_dist = 'Gauss'; % type of probability distributions
options.type_of_phi = 'star'; % type of phi
options.type_of_MIPsearch = 'Exhaustive'; % type of MIP search
options.type_of_complexsearch = 'Exhaustive'; % type of complex search
options.normalization = 0; % normalization of phi by Entropy

%% Stress data_set
participant = 1:20;
participant([11, 14]) = [];
setting = ["Control", "Active", "Passive"];
name = ["Fz", "Cz", "Pz", "ECG", "EDA"];
interval = 1000; % 2 sec per
% frame rate 500 Hz

%% compute phis and save data

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

bits = [1, 2, 4, 8, 16];
lists = 1:5;

for i = 1 : length(participant)
    for j = 1:3
        [Control_PHI{i,j}, Control_sumPHI{i,j}, Control_Ctype{i,j}, Control_Cnum{i, j}] = ...
            MC_function(Control_data{i, j}, interval, params, options, lists);
        [Active_PHI{i,j}, Active_sumPHI{i,j}, Active_Ctype{i,j}, Active_Cnum{i, j}] = ...
            MC_function(Active_data{i, j}, interval, params, options, lists);
        [Passive_PHI{i,j}, Passive_sumPHI{i,j}, Passive_Ctype{i,j}, Passive_Cnum{i, j}] = ...
            MC_function(Passive_data{i, j}, interval, params, options, lists);
    end
end

%%
save_active;
save_passive;
save_control;

