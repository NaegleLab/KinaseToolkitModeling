% This code uses the programs getGlobalkcat.m, getGlobalKd.m,
% getGlobalkm1.m, getGlobalkm2.m, getGlobalKm.m, getGlobalSpecificity, setGlobalKd.m,
% setGlobalkm1.m, setGlobalkm2.m, setGlobalKmkcat.m and VectorModel.m
function ERBB2_specificities
f = figure;
ax = axes(f);
ax.Units = 'pixels';
ax.Position = [75 75 500 400];
c = uicontrol(f,'Style','popupmenu');
% c.Position = [20 75 60 20];
c.Position = [600 75 100 20];
c.String = {'Choose','Y1023','Y1127','Y1139', 'Y1196', 'Y1121', 'Y1122', 'Y1248'};
c.Callback = @selection;

    function selection(src,event)
        disp('running')
        % clears axes
        cla
        val = c.Value;
        if val == 2
            setGlobalKmkcat(1023);
        elseif val == 3
            setGlobalKmkcat(1127);
        elseif val == 4
            setGlobalKmkcat(1139)
        elseif val == 5
            setGlobalKmkcat(1196)
        elseif val == 6
            setGlobalKmkcat(1121)
        elseif val == 7
            setGlobalKmkcat(1122)
        elseif val == 8
            setGlobalKmkcat(1248)
        else
            disp('Please select a Tyrosine site on ErbB2')
            return
        end
        for i = 0:4
            setGlobalKd(i);
            % Evaluate the initial concentration of Kinase in uM
            kin = 20/100;
            
            tRange = [0 500];
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
            phospho_ratio = (P_pS+HPps_K+HPps_KSp)./(P_S+HPs_K+H_KSp+HP_KS+2*HPs_KSp+2*HPps_KSp+P_pS+HPps_K);
            
            hold on
            plot(T,phospho_ratio)
            xlabel('Time (min)')
            ylabel('Phosphorylated Substrate Ratio')
        end
        legend({'No interaction', '3BP1', '3BP2', 'p41', 'p40'}, 'Location', 'northwest')
        spec = getGlobalspecificity;
        disp(['Catalytic Specificity: ' num2str(spec)]);
    end

end