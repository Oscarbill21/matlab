num = 1;
den = [1 7 0];
G = tf(num, den);

rlocus(G)
OS =15;
zeta = -log(OS/100)/sqrt(pi^2+(log(OS/100))^2)
%Draw line from origin with the angle cos^(-1) zeta
sgrid(zeta,0);
%The point of intersection of the line with the root Locus
%gives the Dominant pole
[k p]=rlocfind(G)
%The Kv for the uncompensted system
Kv_UnC = 4/k;
sseDesired = 14/70;
Kv_Desired = 1/sseDesired;
Ratio = Kv_Desired/Kv_UnC;
%Taking an arbitrary vaue for the pole
b = 0.002;
%The zero
a = b*Ratio;
Gc = tf([1 a], [1 b]);
G_System = Gc*G*k;
rlocus(G_System,G);
closedLoopSys =(feedback(G_System,1));
ClosedLoopG = feedback(G*k,1);
step(closedLoopSys,(ClosedLoopG))
%stepinfo(closedLoopSys)


