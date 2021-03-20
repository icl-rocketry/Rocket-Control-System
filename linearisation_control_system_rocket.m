

syms rho Sref Cd  W z m theta T 
f1=W;

f2=T*sin(theta)/m-0.5*rho*Sref*Cd*(W^2)*sin(theta)/m-9.81;

A=[diff([f1;f2],z),diff([f1;f2],W)];

B=diff([f1;f2],T);

C=[1,0;0,1];

D=[0;0];

eigA=eig(A);


