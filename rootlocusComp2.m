num = 1;
den = [1 5 4 0];
G = tf(num, den);

rlocus(G)
OS =10;
zeta = -log(OS/100)/sqrt(pi^2+(log(OS/100))^2)
%Draw line from origin with the angle cos^(-1) zeta
sgrid(zeta,0);
%The point of intersection of the line with the root Locus
%gives the Dominant pole
[k p]=rlocfind(G)
%The Kv for the uncompensted system
Kv_UnC = k/4;
sseDesired = 14/70;
Kv_Desired = 1/sseDesired;
Ratio = Kv_Desired/Kv_UnC
%Taking an arbitrary vaue for the pole
b = 0.01;
%The zero
a = b*Ratio;
Gc = tf([1 a], [1 b]);
GcG = G*Gc;
s1 = -0.4008 + 0.6077*i;
magnitude1 = abs(evalfr(GcG,s1));
k1 = 1/ magnitude1
G_System = Gc*G*k1;
rlocus(G_System,G*k)
closedLoopSys =(feedback(G_System,1));
ClosedLoopG = feedback(G*k,1);
%step(closedLoopSys,(ClosedLoopG))
%stepinfo(closedLoopSys)


