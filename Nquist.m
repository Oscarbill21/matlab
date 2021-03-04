num = 84;
den = [1 8 12 0];
G = tf(num,den);
nyquist(G);
title ('Uncompensated Nyquist Plot');
Required_PM = 45+5;
phase_Required = - 180 + Required_PM;
[mag,phase,wout] = bode(G);
%Frequency at New Cross Over(Wc)
phase  = squeeze(phase);
Wc = interp1(phase,wout,phase_Required);
%Gain at Wc
mag = squeeze(mag);
NewGainNeeded = interp1(wout,20*log10(mag),Wc);
%The gain the lag compensator must provide
%Choosing the high freq break to be a decade below
zeroLag = Wc/10;
Beta = (10^(NewGainNeeded/20));%^-1;
poleLag = zeroLag/Beta;

Gc = tf([1 zeroLag],[1 poleLag ]);
%Compensated System
G_SysComp = Gc*G/Beta;
margin(G_SysComp);
nyquist(G_SysComp)
axis ([-300 200 -5000 5000])
title('Compensated System Nyquist Plot')
