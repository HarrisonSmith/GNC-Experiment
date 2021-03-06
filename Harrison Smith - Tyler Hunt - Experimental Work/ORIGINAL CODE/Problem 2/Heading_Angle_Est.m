%% PROBLEM 2

clear variables; close all; clc

data_table_mag = readtable('Magnetometer_Prob_2.csv');



%% Magnetometers
bias_mag =[-12.11214937;
           -19.67616054;
            22.73696197];
var_mag = [0.467656955	0	         0;
           0	        0.744016854	 0;
           0	        0	         0.463154807];


mag_x = data_table_mag{:, 2};
mag_y = data_table_mag{:, 3};
mag_z = data_table_mag{:, 4};

mag_x_wo_bias = mag_x - bias_mag(1);
mag_y_wo_bias = mag_y - bias_mag(2);
mag_z_wo_bias = mag_z - bias_mag(3);

magnetic_heading_data	= -atan2( mag_y_wo_bias, mag_x_wo_bias );
declination				= -14.07*pi/180;
% Declination  for Worcester, MA found using World Magnetic Model
% https://www.ngdc.noaa.gov/geomag/calculators/magcalc.shtml#declination

true_heading_data	= declination + magnetic_heading_data;
true_heading_mu		= mean(true_heading_data)
disp('rad')
true_heading_var	= var(true_heading_data)
disp('rad')


fprintf('The heading is %f deg +/- %f deg\n', ...
	true_heading_mu*180/pi, 3*sqrt(true_heading_var)*180/pi);

Validity = ['This heading is accurate given the orientation of the device '...
    'and that the positive x axis faced west'];
disp(Validity)