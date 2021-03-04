num = 1;
den = [1 24 80 0];
G = tf(num, den);
%Calculte Kv from steady state error
sse = 0.04;
Kv = 1/sse;
%Calculate K from Kv using Lim as s->0
K = 2000;
G1 = K*G;
[Gm,Pm,Wcg, Wcp] = margin(G1);
margin(G1);
Required_PM = 40;
%Required additional Phase Needed
AddPhase = (Required_PM - Pm) + 5;
%Determining the attenuation factor on the basis
%of required phase angle lead
a = (1-sind(AddPhase))/(1+sind(AddPhase));
NewCrossOverGain = -20*log10(1/sqrt(a))
[mag,phase,wout] = bode(G1);
%Frequency at New Cross Over Gain (Wc)
mag  = squeeze(mag);
Wc = interp1(20*log10(mag),wout,NewCrossOverGain)
zeroLeadComp = sqrt(a)*Wc; %z
poleLeadComp = Wc/sqrt(a); %p
%KcLead = K/a;              %Kc
GcLead = tf([1 zeroLeadComp],[1 poleLeadComp ]);
GLead = G1*GcLead;
%Choosing the zero to be a decade below Wc
zeroLag = Wc/10;
%Taking the case where Beta is 1/a
Beta = 1/a;
poleLag = zeroLag/Beta;
GcLead = tf([1 zeroLeadComp],[1 poleLeadComp ]);
GcLag = tf([1 zeroLag],[1 poleLag ]);
G_SysCompensated = G1*GcLead*GcLag;
bode(G_SysCompensated,G1);





