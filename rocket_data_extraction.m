clear
clc

fileID=fopen('open_rocket_data.csv','r');

time(1:123)=0;

altitude(1:123)=0;

Vertical_velocity(1:123)=0;

Mass(1:123)=0;

Cd(1:123)=0;

T(1:123)=0;%temperature

P(1:123)=0;



for i=1:123
    time(i)=fscanf(fileID,'%f',1);

    altitude(i)=fscanf(fileID,'%f',1);

    Vertical_velocity(i)=fscanf(fileID,'%f',1);

     Mass(i)=fscanf(fileID,'%f',1);

      Cd(i)=fscanf(fileID,'%f',1);
      
      T(i)=fscanf(fileID,'%f',1);
   
     P(i)=fscanf(fileID,'%f',1);
end


fclose(fileID);

R=287;

rho=P./(R*T);