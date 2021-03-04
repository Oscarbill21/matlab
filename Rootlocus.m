%Drawing the step function of the Transfer Function 
num = 1;
den = [1 4 3];
%Plant
G1 = tf (num,den);
%Closed Loop Transfer Function
ClosedLoopTF = feedback(G1,1);
step(ClosedLoopTF);
title (' Figure 1 Step Response')
stepinfo(ClosedLoopTF)

%Design with stated specifications
%The percentage overshoot
OS = 20;
%Formula for getting Damping Ratio from OS
%Zeta = -log(OS/100)/sqrt(pi^2+(log(0S/100)^2))
Zeta =0.4559;
%Natural frequency calculated from second order xtic equation
wn = 3.6;
rlocus(G1*9)
grid on;
axis ([-5 2 -6 6])
sgrid (Zeta,wn)
title ("Root locus plot")
grid off
%Taking an arbitral value of k
k = 9;
closedLoop = feedback(k*G1,1);
%step(closedLoop)
%title("Figure 2 Step reponse with design requirements met")
stepinfo(closedLoop)




 













