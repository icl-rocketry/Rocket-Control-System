clear
clc

syms rho Sref Cd  W z m theta T 
f1=W;

f2=T*sin(theta)/m-0.5*rho*Sref*Cd*(W^2)*sin(theta)/m-9.81;

A=[diff([f1;f2],z),diff([f1;f2],W)];

A(2,2)=-(Cd.*Sref.*W.*rho.*sin(theta))./m;

B=diff([f1;f2],T);

C=[1,0;0,1];

D=[0;0];

eigA=eig(A);

load('rocket_workspace.mat')

Srefsubs(1:123)=Sref;

Cdsubs=Cd;

rhosubs=rho;

Mass_subs=Mass;


syms Cd Sref W rho theta m
for i=1:123
A2_2(i)=double(vpa(subs(A(2,2),{Cd,Sref,W,rho,theta,m},{Cdsubs(i),Srefsubs(i),Vertical_velocity(i),rhosubs(i),flight_angle(i),Mass_subs(i)})));

B2_1(i)=double(vpa(subs(B(2,1),{theta,m},{flight_angle(i),Mass_subs(i)})));

end


for j=1:123
    A_time(:,:,j)=[0,1;0,A2_2(j)];
    
    B_time(:,:,j)=[0;B2_1(j)];
end
