function [f] = dXdt(t, x)
    s = x(1);
    e = x(2);
    es = x(3);
    p = x(4);
    
    k1 = 1;
    km1 = 1;
    kcat = 0.5;
    
    dedt = (km1+kcat)*es - k1*e*s;
    dsdt = km1*es - k1*e*s;
    desdt = k1*e*s - (km1+kcat)*es;
    dpdt = kcat*es;
    
    f = [dedt; dsdt; desdt; dpdt];
end
%  P-S
%  H-K
%  P-SKh
%  PHk-S
%  PHk-SKh
%  PH=SK