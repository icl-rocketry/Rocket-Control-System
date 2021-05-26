% Rocket dynamics model for ATTACC
% Hayley Wong
% 22/05/2021
% v.2

function a = dynamics(T,D,m,theta)

g = 9.81;

a = (1/m)*(T*sin(theta)-D*sin(theta)-m*g);
return