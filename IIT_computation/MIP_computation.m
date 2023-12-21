clearvars;

%% data_set
import_data;

%% parameters for phi computation
params.tau = 1; % time lag
options.type_of_dist = 'Gauss'; % type of probability distributions
options.type_of_phi = 'star'; % type of phi
options.type_of_MIPsearch = 'Exhaustive'; % type of MIP search
options.normalization = 0; % normalization by Entropy

%% Stress data_set
participant = 1:20;
participant([11, 14]) = [];
setting = ["Control", "Active", "Passive"];
name = ["Fz", "Cz", "Pz", "ECG", "EDA"];
interval = 2000; % 6 sec per
% frame rate 500 Hz

%% compute phis and save data

Active_PHI = cell(18, 3); % No time limit/ easy computation
Control_PHI = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_PHI = cell(18, 3); % Time limited (3 sec)/ hard computation

Active_Cut = cell(18, 3); % No time limit/ easy computation
Control_Cut = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_Cut = cell(18, 3); % Time limited (3 sec)/ hard computation

bits = [1, 2, 4, 8, 16];

for ind = 1 : length(participant)
    for j = 1:3
        [cut , phi] = MIP_function(Control_data{ind, j}, interval, params, options);
        Control_PHI{ind, j} = phi;
        Control_Cut{ind, j} = sum((cut-1).*bits, 2);
        [cut , phi] = MIP_function(Active_data{ind, j}, interval, params, options);
        Active_PHI{ind, j} = phi;
        Active_Cut{ind, j} = sum((cut-1).*bits, 2);
        [cut , phi] = MIP_function(Passive_data{ind, j}, interval, params, options);
        Passive_PHI{ind, j} = phi;
        Passive_Cut{ind, j} = sum((cut-1).*bits, 2);
    end
end
%%

MIP_save_active;
MIP_save_passive;
MIP_save_control;

