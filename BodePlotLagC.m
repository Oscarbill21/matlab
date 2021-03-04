num = 1;
den = [1 22 40 0];
G = tf(num,den);
%Gain adjusted Plant to achieve Kv of 12
K =500;
G1 = K*G;
[Gm,Pm,Wcg, Wcp] = margin(G1);
margin(G1);
Required_PM = 45; %After addition of the compensating phase
phase_Required = - 180 + Required_PM;
[mag,phase,wout] = bode(G1);
%Frequency at New Cross Over(Wc)
phase  = squeeze(phase);
Wc = interp1(phase,wout,phase_Required);
%Gain at Wc
mag = squeeze(mag);
NewCrossOverGainNeeded = interp1(wout,20*log10(mag),Wc);
%The lag compensator must provide -15.0195
%Choosing the high freq break to be a decade below
zeroLag = Wc/10;
Beta = (10^(NewCrossOverGainNeeded/20));%^-1;
KcLag= K/Beta ;
poleLag = zeroLag/Beta;
GcLag = tf(KcLag*[1 zeroLag],[1 poleLag ]);
%Lag Compensated System
G_SysComp = G*GcLag;
bode(G_SysComp,G1);
text(0.684,-122,'Compensated System');
text(27.6,-230,'Uncompensated System');
title('Lag Compensated Bode Plot');

