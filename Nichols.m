
s = tf('s');
G = 1/(s*(1+(s/200))*(1+(s/250)));
k=91;
G_Sys=(k*G);
nichols(G_Sys)