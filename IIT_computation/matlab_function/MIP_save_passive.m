%% Passive condition
mkdir Passive

mkdir MIP_PHI
DatatoFolder_MIP(Passive_PHI, "MIP_PHI");

mkdir MIP_cut
DatatoFolder_MIP(Passive_Cut, "MIP_cut");

movefile MIP_PHI Passive
movefile MIP_cut Passive