num = 320;
den = [10 26 176 160];
G = tf(num, den);
%Bode Plot for the uncompensated system
[Gm,Pm,Wcg, Wcp] = margin(G);
margin(G);
Required_PM = 45;
%Required additional Phase Needed
AddPhase = (Required_PM - Pm) + 5;
%Determining the attenuation factor on the basis
%of required phase angle lead
a = (1-sind(AddPhase))/(1+sind(AddPhase));
NewCrossOverGain = -20*log10(1/sqrt(a));
[mag,phase,wout] = bode(G);
%Frequency at New Cross Over Gain (Wc)
mag  = squeeze(mag);
Wc = interp1(20*log10(mag),wout,NewCrossOverGain);
zeroLeadComp = sqrt(a)*Wc; %z
poleLeadComp = Wc/sqrt(a); %p
KcLead = 2/a;              %Kc
GcLead = tf(KcLead*[1 zeroLeadComp],[1 poleLeadComp ]);
G_CompSys = G*GcLead;
G_CompSys1 = minreal(G_CompSys);
zeroLag=Wc/10;
poleLag=zeroLag*a;
KcLag=a
TF_lag=tf(KcLag*[1 zeroLag],[1 poleLag]);
G_compensated=G*TF_lag;

margin(G_compensated)
%step(feedback(G_compensated,1));






