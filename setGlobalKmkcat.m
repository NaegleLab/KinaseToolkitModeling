function setGlobalKmkcat(val)
global Km
global kcat
global specificity

% Source: EGFR kinase possesses a broad specificity for ErbB phosphorylation sites, and ligand increases catalytic-centre activity without affecting substrate binding affinity
% URL: https://portlandpress.com/biochemj/article/392/3/417/41648

% Units
% Km - uM
% kcat - min^-1

if val == 1023
    % kcat/Km = 11.7 min^(-1)*mM^(-1)
    specificity = 11.7;
    Km = 215; 
    kcat = 2.5;
elseif val == 1127
    % kcat/Km = 2.1 min^(-1)*mM^(-1)
    specificity = 2.1;
    Km = 516;
    kcat = 1.1;
elseif val == 1139
    % kcat/Km = 19.5 min^(-1)*mM^(-1)
    specificity = 19.5;
    Km = 220;
    kcat = 4.3;
elseif val == 1196
    % kcat/Km = 7.6 min^(-1)*mM^(-1)
    specificity = 7.6;
    Km = 280;
    kcat = 2.1;
elseif val == 1121 || val == 1122
    % kcat/Km = 31.8 min^(-1)*mM^(-1)
    specificity = 31.8;
    Km = 140;
    kcat = 4.4;
elseif val == 1248
    % kcat/Km = 8.1 min^(-1)*mM^(-1)
    specificity = 8.1;
    Km = 197;
    kcat = 1.6;
else
    disp('Error. Choose a proper Y location on ErbB2')
end