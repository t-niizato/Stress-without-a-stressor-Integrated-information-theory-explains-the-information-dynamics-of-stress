%% Active condition
mkdir Active

mkdir SumPHI
DatatoFolder(Active_sumPHI, "SumPHI");

mkdir PHI
DatatoFolder(Active_PHI, "PHI");

mkdir CompType
DatatoFolder(Active_Ctype, "CompType");

mkdir CompNum
DatatoFolder(Active_Cnum, "CompNum");

movefile PHI Active
movefile sumPHI Active
movefile CompType Active
movefile CompNum Active



