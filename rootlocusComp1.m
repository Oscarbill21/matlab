num = 1;
den = [1 5 4 0];
G = tf(num, den);
ClosedLoopG = feedback(G,1);
wn = 2;
z =0.5;
s1 =(-z*wn)+(wn*sqrt(1-z^2)*i);
s2 = conj(s1);
%Getting the angles from open loop pole
%to the closed loop pole on the root locus
% Angle at open loop s=-1
Angle_1 = 90;
Angle_0 = 180 - ((180/pi)*atan(imag(s1)));
Angle_4 = (180/pi)*atan(imag(s1)/3);
Sum = Angle_1 + Angle_0 + Angle_4;
%From Angle Magnitude
%Angle to be provided by compensator zero
AngleComp = Sum - 180;
%Position of zero
a = (imag(s1)/(tand(AngleComp)))+1
Gc = tf([1 a],1);
%Using angle Magnitude property of root locus to get K
GcG = Gc*G;
rlocus(GcG);
magnitude1 = abs(evalfr(GcG,s1));
k = 1/ magnitude1;
CompSystem = k*GcG;
rlocus(CompSystem,G)
closedLSysComp = feedback(CompSystem,1);
%step(closedLSysComp,ClosedLoopG);
%stepinfo(closedLSysComp)







