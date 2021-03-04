%Plant transfer function
num = [];
den = [1 -1 -5];
G = zpk (num, den,1);
rlocus(G);
z = 0.5;
wn = 2;
desired_pole = (-z*wn)+(wn*sqrt(1-z^2)*i)
%Using angle Criterion property of root locus to get a
angle_desired_pole = (180/pi)*angle(evalfr(G,desired_pole))
angle_a = 180 - angle_desired_pole
a =(imag(desired_pole)/tan(angle_a*pi/180))-real(desired_pole)

%Compenstator
numc=[1 a];
denc=[1];
Gc = tf(numc, denc);
%Using angle Magnitude property of root locus to get K
GcG = Gc*G;
magnitude1 = abs(evalfr(GcG,desired_pole));
k = 1/ magnitude1
System = k*GcG;
rlocus(System,G)
closedLoop = feedback(System,1);
%step(closedLoop);
%stepinfo(closedLoop);








