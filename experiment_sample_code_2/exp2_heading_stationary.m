clear variables; close all; clc

data_table_mag = readtable('data_exp1_202007092008.xls', 'Sheet', 3);
load sensor_calibration.mat bias_mag var_mag


%% Magnetometers
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
true_heading_mu		= mean(true_heading_data);
true_heading_var	= var(true_heading_data);

fprintf('The heading is %f deg +/- %f deg\n', ...
	true_heading_mu*180/pi, 3*sqrt(true_heading_var)*180/pi);

