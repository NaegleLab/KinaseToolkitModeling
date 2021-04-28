clear
ratio = [];


tRange = [0 500];
IC = [2, 20, 0, 0, 0, 0, 0, 0, 0];
[T,Y] = ode45(@VectorModel, tRange, IC);

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
plot(T,Y)
legend('H-K', 'P-S', 'HP_s-K', 'H-KS_p', 'HP-KS', 'HP_s-KS_p', 'P-pS', 'HP_p_S-K', 'HP_p_S-KS_p')
xlabel('Time (min)')
ylabel('Concentration (uM)')
%annotation('textbox', [0.3, 0.2, 0.1, 0.1], 'String',"Phosphorylated:Nonphosphorylated Substrate Ratio: "+num2str(phospho_unphospho_ratio))

figure(2)
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')