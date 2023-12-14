%% Active condition
mkdir Active

mkdir MIP_PHI
DatatoFolder_MIP(Active_PHI, "MIP_PHI");

mkdir MIP_cut
DatatoFolder_MIP(Active_Cut, "MIP_cut");

movefile MIP_PHI Active
movefile MIP_cut Active