clear
ratio = [];


tRange = [0 500];
IC = [1000, 1000, 0, 0, 0, 0, 0, 0, 0];
[T,Y] = ode45(@VectorModel, tRange, IC);

% finds index of val in T which should correspond to the values at time = val
% Used to find values at a specific time point so that we can calculate 
val = 5; % minutes
[ d, ix ] = min( abs( T-val ) );

P_S = Y(ix,2);
HPs_K = Y(ix,3);
H_KSp = Y(ix,4);
HP_KS = Y(ix,5);
HPs_KSp = Y(ix,6);
P_pS = Y(ix,7);
HPps_K = Y(ix,8);
HPps_KSp = Y(ix,9);
phospho_unphospho_ratio = (P_pS+HPps_K+HPps_KSp)/(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+HPps_KSp);
ratio = [ratio, phospho_unphospho_ratio];

plot(T,Y)
legend('H-K', 'P-S', 'HP_s-K', 'H-KS_p', 'HP-KS', 'HP_s-KS_p', 'P-pS', 'HP_p_S-K', 'HP_p_S-KS_p')
xlabel('Time (min)')
ylabel('Concentration (uM)')
annotation('textbox', [0.3, 0.2, 0.1, 0.1], 'String',"Phosphorylated:Nonphosphorylated Substrate Ratio: "+num2str(phospho_unphospho_ratio))

