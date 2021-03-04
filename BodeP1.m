num = 2;
den = [0.0625 0.1625 1.1 1];
G =tf(num,den);
%Bode Plot for the uncompensated system
[Gm,Pm,Wcg, Wcp] = margin(G);
%margin(G);

Required_PM = 45; %After addition of the compensating phase
phase_Required = - 180 + Required_PM;
[mag,phase,wout] = bode(G);
%Frequency at New Cross Over(Wc)
phase  = squeeze(phase);
Wc = interp1(phase,wout,phase_Required);
%Gain at Wc
mag = squeeze(mag);
NewCrossOverGainNeeded = interp1(wout,20*log10(mag),Wc);
%The lag compensator must provide -15.0195
%Choosing the high freq break to be a decade below
zeroLag = Wc/10;
Beta = (10^(NewCrossOverGainNeeded/20));%8.4853
KcLag= 2/Beta ;
poleLag = zeroLag/Beta;

GcLag = tf(KcLag*[1 zeroLag],[1 poleLag ]);
%Lag Compensated System
G_SysComp = G*GcLag;

bode(G_SysComp,G)
%step(G_CompSys,G1);
text(0.571,-41.9,'Compensated System');
text(11.7,-175,'Uncompensated System');
title('Lag Compensated Bode Plot');

