%% Control condition
mkdir Control

mkdir SumPHI
DatatoFolder(Control_sumPHI, "SumPHI");

mkdir PHI
DatatoFolder(Control_PHI, "PHI");

mkdir CompType
DatatoFolder(Control_Ctype, "CompType");

mkdir CompNum
DatatoFolder(Control_Cnum, "CompNum");

movefile PHI Control
movefile sumPHI Control
movefile CompType Control
movefile CompNum Control



