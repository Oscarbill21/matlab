num = 1;
den = [1 1 0];
G = tf(num,den);
%Gain adjusted Plant to achieve Kv of 12
K =12;
G1 = K*G;
[Gm,Pm,Wcg, Wcp] = margin(G1);
margin(G1);
Required_PM = 45;
%Required additional Phase Needed
AddPhase = (Required_PM - Pm) + 5;
%Determining the attenuation factor on the basis
%of required phase angle lead
a = (1-sind(AddPhase))/(1+sind(AddPhase));
NewCrossOverGain = -20*log10(1/sqrt(a))
[mag,phase,wout] = bode(G1);
%Frequency at New Cross Over Gain (Wc)
mag  = squeeze(mag);
Wc = interp1(20*log10(mag),wout,NewCrossOverGain);
zeroLeadComp = sqrt(a)*Wc; %z
poleLeadComp = Wc/sqrt(a); %p
KcLead = K/a;              %Kc
GcLead = tf(KcLead*[1 zeroLeadComp],[1 poleLeadComp ]);
G_CompSys = G*GcLead;
%G_CompSys1 = minreal(G_CompSys);
bode(G_CompSys,G1);
text(13.2,-153,'Compensated System')
text(0.239,-103,'Uncompensated System')
title('Lead Compensated Bode Plot')

closedLoopComp = feedback(G_CompSys,1);
closedLoopUncomp=feedback(G1,1);

step(closedLoopComp,closedLoopUncomp)
title ("Step response of Lead Compensated and Uncomp System")
