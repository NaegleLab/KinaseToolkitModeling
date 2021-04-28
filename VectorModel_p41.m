function [f] = VectorModel_p41(t,x)

H_K = x(1);
P_S = x(2);
HPs_K = x(3);
H_KSp = x(4);
HP_KS = x(5);
HPs_KSp = x(6);
P_pS = x(7);
HPps_K = x(8);
HPps_KSp = x(9);

% KD for interaction between ABL SH3 domain and the polyproline sequence (k1 and km1)
% Source : Crystal structure of the abl-SH3 domain complexed with a designed high-affinity peptide ligand: implications for SH3-ligand interactions

% 3BP1 - 34 uM
% 3BP2 - 5 uM
% p41 - 1.5 uM
% p40 - 0.4 uM
Kd_3BP1 = 34;
Kd_3BP2 = 5;
Kd_p41 = 1.5;
Kd_p40 = 0.4;

% kcat and Km for EGFR kinase on Y1197
% Source: Structures of lung cancer-derived EGFR mutants and inhibitor complexes: mechanism of activation and insights into differential inhibitor sensitivity
% kcat = 0.023 s^-1
% Km = 949 uM
Km = 949;

% Big assumption is that we are setting the off rate constant so that we can use the information we have to get similar kinetics
% Assumption: km1 = km2 = 1
kcat = 0.023*60; 
km2 = getGlobalkm2*60;
k2 = km2/Kd_p41;
km1 = getGlobalkm1*60;
k1 = (km1+kcat)/Km;
% just guestimating keff for now
k1eff = 1.5*k1;
k2eff = 1.5*k2;

dH_Kdt = km2*HPs_K + (km1+kcat)*H_KSp + km2*HPps_K - (k2+k1)*H_K*P_S - k2*H_K*P_pS;
dP_Sdt = km2*HPs_K + km1*H_KSp + (km2+km1)*HPs_KSp + km1*HPps_KSp - (k1+k2)*H_K*P_S - k2*H_KSp*P_S - k1*HPs_K*P_S - k1*HPps_K*P_S;
dHPs_Kdt = k2*H_K*P_S + (km1+kcat)*HPs_KSp + km1*HP_KS - (km2+k1eff)*HPs_K - k1*HPs_K*P_S;
dH_KSpdt = k1*H_K*P_S + km2*HP_KS + km2*HPs_KSp - (km1+k2eff+kcat)*H_KSp - k2*H_KSp*P_S;
dHP_KSdt = k1eff*HPs_K + k2eff*H_KSp - (km1+km2+kcat)*HP_KS;
dHPs_KSpdt = k2*H_KSp*P_S + k1*HPs_K*P_S - (km2+kcat+km1)*HPs_KSp;
dP_pSdt = kcat*HPs_KSp + kcat*H_KSp + kcat*HPps_KSp + km2*HPps_K - k2*H_K*P_pS;
dHPps_Kdt = k2*H_K*P_pS + kcat*HP_KS + (km1+kcat)*HPps_KSp - km2*HPps_K - k1*HPps_K*P_S;
dHPps_KSpdt = k1*HPps_K*P_S - (km1+kcat)*HPps_KSp;

f = [dH_Kdt; dP_Sdt; dHPs_Kdt; dH_KSpdt; dHP_KSdt; dHPs_KSpdt; dP_pSdt; dHPps_Kdt; dHPps_KSpdt];
end

