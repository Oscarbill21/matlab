num = 1;
den =[1 6 8 0 ];
G2 = tf(num, den);
%Damping ratio 
zeta = 0.5;
rlocus(G2)
grid on 
sgrid(0.5,0)
[k,poles]=rlocfind(G2)



