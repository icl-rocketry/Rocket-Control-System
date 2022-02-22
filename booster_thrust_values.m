clear
clc

fid=fopen('booster_thrust_values.txt','r');

fscanf(fid,'%s',35)

for i=1:38

    
    
fscanf(fid,'%s',1)

fscanf(fid,'%c',5)

time(i)=fscanf(fid,'%f',1);


fscanf(fid,'%c',5)

thrust(i)=fscanf(fid,'%f',1);

fscanf(fid,'%c',5)

m(i)=fscanf(fid,'%f',1);

fscanf(fid,'%s',2)


end


thrust_timeseries=timeseries(thrust',time');

theta_pertubation=linspace(-35*pi/180,35*pi/180,30);


time_pertubation=linspace(0,14.42,30);

theta_pertubation_time=timeseries(theta_pertubation',time_pertubation');

drag_pertubation=30*sin(2*pi*time_pertubation/14.42);

drag_pertubation_time=timeseries(drag_pertubation',time_pertubation');

Isp=198.781;

dmdt=thrust/Isp/9.81;

dmdt_timeseries=timeseries(dmdt',time');
