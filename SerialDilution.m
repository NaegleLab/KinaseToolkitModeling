clear
ratio = [];

for i=0:-1:-2

tRange = [0 500];
IC = [2*10^i, 20, 0, 0, 0, 0, 0, 0, 0];
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
hold on
plot(T,phospho_ratio)
xlabel('Time (min)')
ylabel('Phosphorylated Substrate Ratio')
end

legend('1:10 Kinase:Substrate Ratio', '1:100 Kinase:Substrate Ratio', '1:1000 Kinase:Substrate Ratio')