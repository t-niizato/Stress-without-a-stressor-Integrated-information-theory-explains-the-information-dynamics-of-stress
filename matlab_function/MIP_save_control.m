%% Control condition
mkdir Control

mkdir MIP_PHI
DatatoFolder_MIP(Control_PHI, "MIP_PHI");

mkdir MIP_cut
DatatoFolder_MIP(Control_Cut, "MIP_cut");

movefile MIP_PHI Control
movefile MIP_cut Control