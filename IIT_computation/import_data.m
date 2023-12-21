head = ["r1", "r2", "task"];
participant = 1:20;
participant([11, 14]) = [];
index = 1:3;
bar = "_";

%%
name = head(1) + bar + num2str(participant(1)) + bar + num2str(index(1)) + ".csv";

Active_data = cell(18, 3); % No time limit/ easy computation
Control_data = cell(18, 3); % Time limited (3 sec)/ easy computation
Passive_data = cell(18, 3); % Time limited (3 sec)/ hard computation

% note: 11_1、14_2 lacked
% とりあえず、11, 14をはずした18人のデータを使用することとする

%%
count = 1;

for i = 1:18 % participant
    for j = 1 : 3 % rest1 / task / rest2
        name = head(j) + bar + num2str(participant(i)) + bar + num2str(index(1)) + ".csv";
        name2 = head(j) + bar + num2str(participant(i)) + bar + num2str(index(2)) + ".csv";
        name3 = head(j) + bar + num2str(participant(i)) + bar + num2str(index(3)) + ".csv";
    
        Active_data{count, j} = readmatrix(name);
        Control_data{count, j} = readmatrix(name2);
        Passive_data{count, j} = readmatrix(name3);
    end
    count = count + 1;
end

