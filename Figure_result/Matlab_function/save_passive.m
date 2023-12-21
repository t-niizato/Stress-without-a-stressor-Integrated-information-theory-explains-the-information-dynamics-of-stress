%% Passive condition
%rmdir Passive s
mkdir Passive

mkdir SumPHI
DatatoFolder(Passive_sumPHI, "SumPHI");

mkdir PHI
DatatoFolder(Passive_PHI, "PHI");

mkdir CompType
DatatoFolder(Passive_Ctype, "CompType");

mkdir CompNum
DatatoFolder(Passive_Cnum, "CompNum");

movefile PHI Passive
movefile sumPHI Passive
movefile CompType Passive
movefile CompNum Passive



