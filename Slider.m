% This script requires the use of additional functions. The functions are
% VectorModel_3BP1.m, VectorModel_3BP2.m, VectorModel_NoInteraction.m,
% VectorModel_p40.m and VectorModel_p41.m

clear

setGlobalkm1(10^-6)

% Evaluate the initial concentration of Kinase in uM
kin = 20/100;

tRange = [0 500];
% Set initial values, with substrate always set at 20 uM (lab protocol)
IC = [kin, 20, 0, 0, 0, 0, 0, 0, 0];
[T,Y] = ode45(@VectorModel_NoInteraction, tRange, IC);

% Format of vector Y
% Y = [H_K, P_S, HPs_K, H_KSp, HP_KS, HPs_KSp, P_pS, HPps_K, HPps_KSp]

% No interaction
P_S = Y(:,2);
HPs_K = Y(:,3);
H_KSp = Y(:,4);
HP_KS = Y(:,5);
HPs_KSp = Y(:,6);
P_pS = Y(:,7);
HPps_K = Y(:,8);
HPps_KSp = Y(:,9);
% phospho_ratio refers to the ratio of phosphorylated product to total substrate
phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);

figure(1)
hold on
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')

% 3BP1
[T,Y] = ode45(@VectorModel_3BP1, tRange, IC);

P_S = Y(:,2);
HPs_K = Y(:,3);
H_KSp = Y(:,4);
HP_KS = Y(:,5);
HPs_KSp = Y(:,6);
P_pS = Y(:,7);
HPps_K = Y(:,8);
HPps_KSp = Y(:,9);
phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);

figure(1)
hold on
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')

% 3BP2
[T,Y] = ode45(@VectorModel_3BP2, tRange, IC);

P_S = Y(:,2);
HPs_K = Y(:,3);
H_KSp = Y(:,4);
HP_KS = Y(:,5);
HPs_KSp = Y(:,6);
P_pS = Y(:,7);
HPps_K = Y(:,8);
HPps_KSp = Y(:,9);
phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);

figure(1)
hold on
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')

% p41
[T,Y] = ode45(@VectorModel_p41, tRange, IC);

P_S = Y(:,2);
HPs_K = Y(:,3);
H_KSp = Y(:,4);
HP_KS = Y(:,5);
HPs_KSp = Y(:,6);
P_pS = Y(:,7);
HPps_K = Y(:,8);
HPps_KSp = Y(:,9);
phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);

figure(1)
hold on
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')

% p40
[T,Y] = ode45(@VectorModel_p40, tRange, IC);

P_S = Y(:,2);
HPs_K = Y(:,3);
H_KSp = Y(:,4);
HP_KS = Y(:,5);
HPs_KSp = Y(:,6);
P_pS = Y(:,7);
HPps_K = Y(:,8);
HPps_KSp = Y(:,9);
phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);

figure(1)
hold on
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')

legend('No interaction', '3BP1', '3BP2', 'p41', 'p40')
title(strcat('Ratio of Phosphorylated Product to Total Substrate with a Kinase to Substrate ratio of 1:',num2str(100)))