clear
clc

fileID=fopen('open_rocket_data_corrected.csv','r');

time(1:360)=0; %in seconds

altitude(1:360)=0; %in meters

Vertical_velocity(1:360)=0; %,m/s

pitchrate(1:360)=0;%degrees /s

Mass(1:360)=0;%grams

Cd(1:360)=0;

T(1:360)=0;%temperature in celcius

P(1:360)=0;% in mbar

Sref=210.06*(10^-2)^2; %reference area in m^2

for i=1:360
    time(i)=fscanf(fileID,'%f',1);

    altitude(i)=fscanf(fileID,'%f',1);

    Vertical_velocity(i)=fscanf(fileID,'%f',1);

   pitchrate(i)=fscanf(fileID,'%f',1);
    
     Mass(i)=fscanf(fileID,'%f',1);

      Cd(i)=fscanf(fileID,'%f',1);
      
      T(i)=fscanf(fileID,'%f',1);
   
     P(i)=fscanf(fileID,'%f',1);
end


fclose(fileID);

R=287;

%conversion in SI units
P=P*10^2;

Mass=Mass/1000;

T=T+273;

pitchrate=pitchrate*pi/180;



%density calculation
rho=P./(R*T);


%flight angle calculation
dt=time(2:length(T))-time(1:length(T)-1);

pitch_rate_average=(pitchrate(1:length(pitchrate)-1)+pitchrate(2:length(pitchrate)))/2;

flight_angle(1:length(T))=0;

for i=1:length(T)-1
flight_angle(i+1)=flight_angle(i)+dt(i)*pitch_rate_average(i);
end

flight_angle=flight_angle+pi/2;

drag=1/2*rho.*Vertical_velocity.^2.*Cd.*Sref;

altitude_series=timeseries(altitude',time');

drag_timeseries=timeseries(drag',time');

mass_timeseries=timeseries(Mass',time');

theta_timeseries=timeseries(flight_angle',time');
