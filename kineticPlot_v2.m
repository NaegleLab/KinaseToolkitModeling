setGlobalKmkcat(1197);
setGlobalKd(0);
% Evaluate the initial concentration of Kinase in uM
% 1:100 ratio of kinase to substrate
kin = 20/100;

tRange = [0 4000];
% Set initial values, with substrate always set at 20 uM (lab protocol)
IC = [kin, 20, 0, 0, 0, 0, 0, 0, 0];
[T,Y] = ode45(@VectorModel, tRange, IC);

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
% phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);
plot(T,Y)

hold on
%plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Concentration of Species (uM)')
legend('H-K', 'P-S', 'HP_s-K', 'H-KS_p', 'HP-KS', 'HP_s-KS_p', 'P-pS', 'HP_p_S-K', 'HP_p_S-KS_p')