function [] = DatatoFolder_MIP(data,name)
%フォルダにデータを入れる関数：データとデータ種類
% PHI, SumPHI, CompType, CompNum (Name)
% CompTypeは別形式
% データはセル形式で受け付ける：出力は空

if name == "MIP_PHI" || name == "MIP_cut"
    for ind = 1:18
        name1 = name + "_" + num2str(ind)+"_task.csv";
        name2 = name + "_" + num2str(ind)+"_rest1.csv";
        name3 = name + "_" + num2str(ind)+"_rest2.csv";

        writematrix(data{ind,3}.', name1)
        writematrix(data{ind,1}.', name2)
        writematrix(data{ind,2}.', name3)

        movefile(name1, name)
        movefile(name2, name)
        movefile(name3, name)
    end
end

end

