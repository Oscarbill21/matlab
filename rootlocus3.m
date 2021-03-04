num = [1 1.545];
den = [1 5 -1 -5];
G = tf(num,den);
K=11;
G1 =K*G
rlocus(G1);
closedLoop = feedback(G1,1);
step(closedLoop)
stepinfo(closedLoop)